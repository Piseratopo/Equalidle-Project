function write_tiles_properties_json() {
   var _tiles_properties = {
      tile_0 : {
         label: "0",
         score: 1,
         sprite_img_id: 1,
      },
      tile_1: {
         label: "1",
         score: 1,
         sprite_img_id: 2,
      },
      tile_2: {
         label: "2",
         score: 1,
         sprite_img_id: 3,
      }
   }

   var _file_tiles_properties = file_text_open_write("tiles_properties.json");
   file_text_write_string(_file_tiles_properties, json_stringify(_tiles_properties));
   file_text_close(_file_tiles_properties);
}


function parse_tiles_properties_json() {
   _file_tiles_properties = file_text_open_read("tiles_properties.json");
   var json_string = "";
   while (!file_text_eof(_file_tiles_properties)) {
       json_string += file_text_readln(_file_tiles_properties);
   }
   file_text_close(_file_tiles_properties);
   
   var _json_data = json_parse(json_string);
   return _json_data;
   
   //show_debug_message(_json_data); // Data Check
}