rack = [
   new TileProperty("tile_0", 1),
   new TileProperty("tile_1", 1),
];
max_rack_size = 8;

rack_flexpanel = flexpanel_create_node({
   left: 0, top: -256, flexDirection: "row", gap: 8
});

for (var _i = 0; _i < max_rack_size; _i++) {
   flexpanel_node_insert_child(rack_flexpanel, flexpanel_create_node({
      width: global.tile_width,
      height: global.tile_height
   }), 0)
}

flexpanel_calculate_layout(rack_flexpanel, undefined, undefined, flexpanel_direction.LTR);

for (var _i = 0; _i < array_length(rack); _i++) {
   var _current_rack_tile = flexpanel_node_get_child(rack_flexpanel, _i);
   
   var _current_position = flexpanel_node_layout_get_position(_current_rack_tile, false);
   var _current_tile = instance_create_layer(
      _current_position.left,
      _current_position.top,
      global.room_layer_name.tiles,
      obj_tile,
      rack[_i]
   );
}