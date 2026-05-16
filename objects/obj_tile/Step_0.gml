// Check if is clicked or not

if (mouse_check_button_pressed(mb_left)) {
   if (clicked) {
      clicked = false;
      y = y_org;
      var _pos = get_position_on_board(
         obj_board_controller.flexpanel_board_layout, 
         mouse_x, 
         mouse_y
      );
      if (_pos and is_placeable_on_board(
         obj_board_controller.board_layout,
         obj_board_controller.board_placement,
         _pos.id_row,
         _pos.id_col
      )) {
         x = _pos.pos_x;
         y = _pos.pos_y;
         x_org = x;
         y_org = y;
         placed_temp = true;
      }
   } else if (position_meeting(mouse_x, mouse_y, self) and playable) {
      clicked = true;
      y = y_org - 16;
   }
}