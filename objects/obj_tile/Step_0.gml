// Check if is clicked or not

if (mouse_check_button_pressed(mb_left)) {
   if (clicked) {
      // Reset the property of the tile
		clicked = false;
      y = y_org;
		if (not is_blank_data(get_position_on_board(obj_board.flexpanel_board_layout, x, y))) {
			obj_board.board_placement[id_row][id_col] = BLANK_DATA;
		}
		
		// Get the tile's position and place it
      var _pos = get_position_on_board(
         obj_board.flexpanel_board_layout, 
         mouse_x, 
         mouse_y
      );
		var _cur_rack = obj_rack.rack;

      if (not is_blank_data(_pos) and is_placeable_on_board(
         obj_board.board_layout,
         obj_board.board_placement,
         _pos.id_row,
         _pos.id_col
      )) {
			// Place the tile on the board

			reset_pos(_pos.pos_x, _pos.pos_y);
			id_row = _pos.id_row; id_col = _pos.id_col;
         placed_temp = true;
			
			obj_board.board_placement[
				_pos.id_row, _pos.id_col
			] = new TileProperty(name, value, BLANK_DATA, playable, buffs);
			
			// Remove the tile from the rack
			for (var _i = 0; _i < array_length(_cur_rack); _i++) {
				if (rack_pos == _cur_rack[_i].rack_pos) {
					array_delete(_cur_rack, _i, 1);
					break;
				}
			}
			rack_pos = BLANK_DATA;
      } else if (is_blank_data(rack_pos)) {
			// Place the tile on the rack
			rack_pos = find_next_pos(_cur_rack);
			array_insert(_cur_rack, rack_pos, new TileProperty(name, value, rack_pos, playable, buffs));
			
			var _pos_rack = get_position_from_rack(obj_rack.rack_flexpanel, rack_pos);
			reset_pos(_pos_rack.pos_x, _pos_rack.pos_y);
		}
   } else if (position_meeting(mouse_x, mouse_y, self) and playable) {
      clicked = true;
      y = y_org - 16;
   }
}