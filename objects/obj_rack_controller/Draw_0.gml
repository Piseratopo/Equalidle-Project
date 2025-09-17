flexpanel_calculate_layout(rack_flexpanel, undefined, undefined, flexpanel_direction.LTR);

for (var _i = 0; _i < array_length(rack); _i++) {
   var _current_rack_tile = flexpanel_node_get_child(rack_flexpanel, _i);
   
   var _current_position = flexpanel_node_layout_get_position(_current_rack_tile, false);
   draw_number_tile(_current_position.left, _current_position.top, rack[_i]);
}