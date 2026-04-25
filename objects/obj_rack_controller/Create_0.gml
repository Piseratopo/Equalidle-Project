rack = [
   new TileProperty("tile_0", 1)
];
max_rack_size = 8;

rack_flexpanel = flexpanel_create_node({
   left: 0, top: -256, flexDirection: "row"
});

for (var _i = 0; _i < max_rack_size; _i++) {
   flexpanel_node_insert_child(rack_flexpanel, flexpanel_create_node({
      width: global.tile_width,
      height: global.tile_height
   }), 0)
}

