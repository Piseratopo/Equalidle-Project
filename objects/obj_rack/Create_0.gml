rack = [
   new TileProperty("tile_0", 1, 0),
   new TileProperty("tile_1", 1, 2),
];
old_rack = [];

actions = [
	"Skip",
	"Swap",
	"Submit"
];

max_rack_size = 10;

bottom_flexpanel = flexpanel_create_node({
	left: 0, top: -256,
	nodes: [
		{
			flexDirection: "row", gap: 8
		}, {
			flexDirection: "row", gap: 8	
		}
	]
})

rack_flexpanel = flexpanel_node_get_child(bottom_flexpanel, 0);

for (var _i = 0; _i < max_rack_size; _i++) {
   flexpanel_node_insert_child(rack_flexpanel, flexpanel_create_node({
      width: global.tile_width,
      height: global.tile_height
   }), 0)
}

action_flexpanel = flexpanel_node_get_child(bottom_flexpanel, 1);
for (var _i = 0; _i < array_length(actions); _i++) {
	flexpanel_node_insert_child(action_flexpanel, flexpanel_create_node({
      flex: 1,
      height: global.tile_height
   }), 0)
}

flexpanel_calculate_layout(bottom_flexpanel, undefined, undefined, flexpanel_direction.LTR);

has_refilled_rack = false;

function refill_rack() {
	fill_rack_from_infinite_bag(
		obj_bag.tile_probability_distribution,
		rack, max_rack_size
	);
	
	var _check_i = 0;
	for (var _i = 0; _i < array_length(rack); _i++) {
		var _curr_rack_pos = rack[_i].rack_pos;
		if (_check_i < array_length(old_rack) and _curr_rack_pos == old_rack[_i].rack_pos) {
			_check_i++;
			continue;
		}
	   var _current_rack_tile = flexpanel_node_get_child(rack_flexpanel, rack[_i].rack_pos);
   
	   var _current_position = flexpanel_node_layout_get_position(_current_rack_tile, false);
	
	   var _current_tile = instance_create_layer(
	      _current_position.left,
	      _current_position.top,
	      global.room_layer_name.tiles,
	      obj_tile,
	      rack[_i]
	   );
	}
	old_rack = variable_clone(rack, 1);
}

