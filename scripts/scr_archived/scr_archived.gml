function panning(){
	// ======================= Create =======================
	
	mouse_x_previous = device_mouse_x_to_gui(0);
	mouse_y_previous = device_mouse_y_to_gui(0);

	// ======================= Step =======================
	
	board_camera_width = camera_get_view_width(board_camera);
	board_camera_height = camera_get_view_height(board_camera);

	// Pan
	if (mouse_check_button(mb_middle)) {
	   board_camera_x += mouse_x_previous - device_mouse_x_to_gui(0);
	   board_camera_y += mouse_y_previous - device_mouse_y_to_gui(0);
	}

	// Zoom
	var _wheel = mouse_wheel_down() - mouse_wheel_up();

	if (_wheel != 0) {
	   _wheel *= 0.1;
   
	   var _add_width = board_camera_width * _wheel;
	   var _add_height = board_camera_height * _wheel;
   
	   board_camera_width += _add_width;
	   board_camera_height += _add_height;
   
	   board_camera_x -= _add_width / 2;
	   board_camera_y -= _add_height / 2;
	}

	camera_set_view_pos(board_camera, board_camera_x, board_camera_y);
	camera_set_view_size(board_camera, board_camera_width, board_camera_height);

	// Store previous values
	mouse_x_previous = device_mouse_x_to_gui(0);
	mouse_y_previous = device_mouse_y_to_gui(0);
}

/**
 * @description Return a clear board with no played tile from a given layout
 * @parameter {Pointer.FlexpanelNode} _flex The flexpanel layout of the board
 * @return {Undefined}
 */
function clear_board(_flex) {
   for (var _i = 0; _i < flexpanel_node_get_num_children(_flex); _i++) {
      // Get the row
      var _row = flexpanel_node_get_child(_flex, _i);
      
      for (var _j = 0; _j < flexpanel_node_get_num_children(_row); _j++) {
         var _cell = flexpanel_node_get_child(_row, _j);
         var _data = flexpanel_node_get_data(_cell);
         
         _data.tile = "";
      }
   }
}
