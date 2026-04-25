var _store_halign = draw_get_halign();
var _store_font = draw_get_font();
draw_set_halign(fa_center);

draw_self();

// Draw the score of the tile
draw_set_font(global.fnt_text);
draw_text(
   x + sprite_width - 20,
   y + sprite_height - string_height("0") - 8,
   string(value)
);

draw_set_font(_store_font);
draw_set_halign(_store_halign);