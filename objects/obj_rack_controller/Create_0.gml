rack = ["tile_0", "tile_1", "tile_0", "tile_2"];
max_rack_size = 8;

rack_flexpanel = flexpanel_create_node({
   left: 0, top: 256, flexDirection: "row"
});

for (var _i = 0; _i < max_rack_size; _i++) {
   flexpanel_node_insert_child(rack_flexpanel, flexpanel_create_node({
      width: sprite_get_width(spr_tile),
      height: sprite_get_height(spr_tile)
   }), 0)
}

