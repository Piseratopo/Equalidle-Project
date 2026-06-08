image_speed = 0;

image_index = global.tiles_id_properties[$ name].sprite_img_id;

x_org = x;
y_org = y;
id_row = -1;
id_col = -1;
//id_row_org = id_row;
//id_col_org = id_col;

if (rack_pos == -1) rack_pos = BLANK_DATA;

clicked = false

function reset_pos(_x, _y) {
	x = _x;
	y = _y;
	x_org = x;
	y_org = y;
}