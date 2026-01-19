if (!is_undefined(obj_board_controller.board_layout)) {
   var _current_board_layout = obj_board_controller.board_layout;
   board_camera_height = sprite_get_height(spr_fnt_tile) * array_length(_current_board_layout) + 2 * board_camera_padding;
   board_camera_width = sprite_get_height(spr_fnt_tile) * array_length(_current_board_layout[0]) + 2 * board_camera_padding;
   camera_set_view_size(view_camera[0], board_camera_width, board_camera_height);
   
   view_board_width = view_board_height * board_camera_width / board_camera_height;
   view_wport[0] = view_board_width;
}