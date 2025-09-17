global.fnt_tile = font_add_sprite_ext(spr_fnt_tile, " 0123456789()+−×÷.-=★", true, 0);
global.allow_characters = 
	" &'()+-./0123456789:=" +
	"ACEFGKLMSTPQ" + 
	"abcdefghiklmnoprstuvxy" + 
	"|×÷⁁−⌫▲▶▼◀";
global.fnt_text = font_add_sprite_ext(
	spr_fnt,
	global.allow_characters,
	true, 2
);

write_tiles_properties_json();