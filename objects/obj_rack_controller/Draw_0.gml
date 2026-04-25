flexpanel_calculate_layout(rack_flexpanel, undefined, undefined, flexpanel_direction.LTR);

for (var _i = 0; _i < array_length(rack); _i++) {
   var _current_rack_tile = flexpanel_node_get_child(rack_flexpanel, _i);
   
   var _current_position = flexpanel_node_layout_get_position(_current_rack_tile, false);
   var _current_tile = instance_create_layer(
      _current_position.left,
      _current_position.top,
      global.room_layer_name.tiles,
      obj_tile,
      {
         name: rack[_i].name,
         value: rack[_i].value,
         buffs: rack[_i].buffs
      }      
   );
}