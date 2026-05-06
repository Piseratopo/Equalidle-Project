/* Board's Data Scripts */

/*
 * @function create_blank_board_data(_grid)
 * @description Create a blank data of the board by iterating through a 2D array (grid)  
 *              and replacing every cell value with an empty string. 
 * @param {Array<Array>} _grid  The 2D array representing the board layout.
 */
function create_blank_board_data(_grid) {
   var _blank_data = [];
   var _height = array_length(_grid);

   for (var i = 0; i < _height; i++) {
      var _row = [];
      var _width = array_length(_grid[i]);
      
      for (var j = 0; j < _width; j++) {
         array_push(_row, BLANK_DATA);
      }
      
      array_push(_blank_data, _row);
   }
   
   return _blank_data;
}

/* Board Drawing Scripts */

/*
 * @description Create a flex panel from a board layout
 * @parameter {Array<Array<String>>} _layout The array layout of the board
 * @parameter {Real} _width The width of a square
 * @parameter {Real} _height The height of a square
 * @return {Pointer.FlexpanelNode} The flex panel of the board
 */
function board_flexpanel_create(_layout, _width, _height){
   var _board_flexpanel = flexpanel_create_node({});

   for (var _row = 0; _row < array_length(_layout); _row++) {
      var _row_flex = flexpanel_create_node({
         flexDirection: "row",
         height: _height,
      });
      
      // Insert every square
      for (var _col = 0; _col < array_length(_layout[_row]); _col++) {
         flexpanel_node_insert_child(_row_flex, flexpanel_create_node({
            width: _width,
            height: _height,
            data: {
               cell_type: _layout[_row][_col]
            },
         }), _col);
      }
      
      // Insert row
      flexpanel_node_insert_child(_board_flexpanel, _row_flex, _row);
   }
   
   return _board_flexpanel;
}

/*
 * @description Draw the board from a flexpanel layout
 * @parameter {Pointer.FlexpanelNode} _flex_layout - The flexpanel layout of the board
 * @return {Undefined}
 */
function draw_board_from_data(_flex_layout, _placement) {
   flexpanel_calculate_layout(_flex_layout, room_width, room_height, flexpanel_direction.LTR);
   var _draw_cell_struct = {
      S: 0,
      H: 1,
      St: 2,
      S2: 3,
      E2: 4,
   };
   for (var _i = 0; _i < flexpanel_node_get_num_children(_flex_layout); _i++) {
      // Get the row
      var _row = flexpanel_node_get_child(_flex_layout, _i);
      
      for (var _j = 0; _j < flexpanel_node_get_num_children(_row); _j++) {
         var _cell = flexpanel_node_get_child(_row, _j);
         // Get cell's position and data
         var _pos = flexpanel_node_layout_get_position(_cell, false);
         var _data = flexpanel_node_get_data(_cell);
         
        // Case where no tile is played on the cell
        var _draw_cell_id = 0;
        if (struct_exists(_draw_cell_struct, _data.cell_type)) {
           _draw_cell_id = _draw_cell_struct[$ _data.cell_type];
        }
        // Draw the cell
        draw_sprite_ext(
           spr_cell, _draw_cell_id, _pos.left, _pos.top,
           _pos.width / sprite_get_width(spr_cell), _pos.height / sprite_get_height(spr_cell),
           0, c_white, 1
        );
      }
   }
}