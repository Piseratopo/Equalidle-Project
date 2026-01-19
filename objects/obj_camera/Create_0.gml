// ======================= Cameras and views =======================

view_enabled = true;
view_visible[0] = true;
view_visible[1] = true;

// Board

board_camera_padding = 32;
board_camera_width = 0;
board_camera_height = 0;
board_camera_x = -board_camera_padding;
board_camera_y = -board_camera_padding;

board_camera = camera_create_view(
   board_camera_x, board_camera_y,
   board_camera_width, board_camera_height
);

view_board_height = display_get_height() / 4 * 3;
view_board_width = view_board_height;
view_set_camera(0, board_camera);
view_wport[0] = view_board_width;
view_hport[0] = view_board_height; 

// Rack

rack_camera_x = -32;
rack_camera_y = -288;

view_rack_height = display_get_height() - view_board_height;
view_rack_width = display_get_width();
rack_camera_height = sprite_get_height(spr_tile) + 64;
rack_camera_width = rack_camera_height * view_rack_width / view_rack_height;

rack_camera = camera_create_view(
	rack_camera_x, rack_camera_y,
	rack_camera_width, rack_camera_height 
);

view_set_camera(1, rack_camera);
view_yport[1] = view_board_height;
view_wport[1] = view_rack_width;
view_hport[1] = view_rack_height; 

// Resize the surface to avoid stretching

total_view_height = view_board_height + view_rack_height;
total_view_width = max(view_board_height, view_rack_width);

surface_resize(application_surface, total_view_width, total_view_height);

