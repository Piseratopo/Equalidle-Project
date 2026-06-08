/**
 * @description Return the absolute position using rack's relative positioning
 * @parameter {Pointer.FlexpanelNode} _flex_rack The flexpanel layout of the rack (the dimension is NOT calculated beforehand)
 * @parameter {Real} _id The id, or the relative position on the rack
 */

function get_position_from_rack(_flex_rack, _id) {
	var _cell = flexpanel_node_get_child(_flex_rack, _id);
	
	var _cell_pos = flexpanel_node_layout_get_position(_cell, false);
	
	return {
		pos_x: _cell_pos.left,
		pos_y: _cell_pos.top
	};
}

function find_next_pos(_rack) {
	var _insert_id = 0;
	while(
		_insert_id < array_length(_rack) and 
		_insert_id == _rack[_insert_id].rack_pos
	) {
		_insert_id++;
	}
	
	return _insert_id;
}

/** 
 * @description Fill a rack from an infinite bag
 */
function fill_rack_from_infinite_bag(_prob_distribution, _rack, _max_rack_size) {
   var _tile_names = variable_struct_get_names(_prob_distribution);
   var _count_distinct_tile = array_length(_tile_names);
    
   var _total_weight = 0;
   for (var i = 0; i < _count_distinct_tile; i++) {
      _total_weight += _prob_distribution[$ _tile_names[i]];
   }

   while (array_length(_rack) < _max_rack_size) {
      var _roll = random(_total_weight);
      var _cumulative_weight = 0;
      var _chosen_tile = "";

      for (var i = 0; i < _count_distinct_tile; i++) {
         _cumulative_weight += _prob_distribution[$ _tile_names[i]];
         if (_roll <= _cumulative_weight) {
               _chosen_tile = _tile_names[i];
               break;
         }
      }
		
		var _insert_pos = find_next_pos(_rack);

      var _new_tile = new TileProperty(
			_chosen_tile,
			global.tiles_id_properties[$ _chosen_tile].def_score, 
			_insert_pos
		);
      array_insert(_rack, _insert_pos, _new_tile);
   }
}