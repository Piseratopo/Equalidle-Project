if (not placement_refreshed) {
   // Place the unplaced tiles
   for (var _i = 0; _i < flexpanel_node_get_num_children(flexpanel_board_layout); _i++) {
      var _row = flexpanel_node_get_child(flexpanel_board_layout, _i);
      for (var _j = 0; _j < flexpanel_node_get_num_children(_row); _j++) {
         var _cell = flexpanel_node_get_child(_row, _j);
         var _pos = flexpanel_node_layout_get_position(_cell, false);
         
         var _curr_placement = board_placement[_i][_j];
         
         if (not is_blank_data(_curr_placement) and !_curr_placement.placed) {
            var _placed_tile = instance_create_layer(
               _pos.left, _pos.top, "Tiles", obj_tile, _curr_placement
            );
            
            _curr_placement.setPlaced();
         }
      }
   }
   placement_refreshed = true;
}

//if (mouse_check_button_pressed(mb_left)) {
   //show_debug_message(is_on_board(flexpanel_board_layout, mouse_x, mouse_y));
//}
