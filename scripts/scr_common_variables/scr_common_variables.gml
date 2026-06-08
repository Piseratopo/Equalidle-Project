// Macro

#macro BLANK_DATA -1

// Game state

randomise();

// Tile settings

tile_width = sprite_get_width(spr_tile);
tile_height = sprite_get_height(spr_tile);

tiles_id_properties = {
   tile_0 : {
      label: "0",
      def_score: 1,
      sprite_img_id: 1,
   },
   tile_1: {
      label: "1",
      def_score: 1,
      sprite_img_id: 2,
   },
   tile_2: {
      label: "2",
      def_score: 1,
      sprite_img_id: 3,
   },
   tile_3: {
      label: "3",
      def_score: 1,
      sprite_img_id: 4,
   }
}

// Room settings

room_layer_name = {
   tiles: "Tiles"
};

// Font settings 

fnt_tile = font_add_sprite_ext(spr_fnt_tile, " 0123456789()+−×÷.-=★", true, 0);
allowed_characters = 
	" &'()+-./0123456789:=" +
	"ACEFGKLMSTPQ" + 
	"abcdefghiklmnoprstuvxy" + 
	"|×÷⁁−⌫▲▶▼◀";
fnt_text = font_add_sprite_ext(
	spr_fnt,
	allowed_characters,
	true, 2
);