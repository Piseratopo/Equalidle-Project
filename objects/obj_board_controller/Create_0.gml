square_width = sprite_get_width(spr_tile);
square_height = sprite_get_height(spr_tile);

/*
 * Convention:
 * S: Square
 * S2, S3, S4, S5: Double Square, Triple Square, Quadruple Square, Quindruple Square
 * E2, E3, E4, E5: Double, Triple, Quadruple, Quindruple Expression
 * St: Starting Square
 * H: Hole
 */
board_layout = [
   ["E2", "S", "S", "S", "S", "S", "E2"],
   ["S", "H", "S", "S2", "S", "S", "S"],
   ["S", "S", "S", "S", "S2", "S", "S"],
   ["S", "S2", "S", "St", "S", "S2", "S"],
   ["S", "S", "S2", "S", "S", "S", "S"],
   ["S", "S", "S", "S2", "S", "H", "S"],
   ["E2", "S", "S", "S", "S", "S", "E2"]
];


flexpanel_board_layout = board_flexpanel_create(board_layout, square_width, square_height);
flexpanel_calculate_layout(flexpanel_board_layout, room_width, room_height, flexpanel_direction.LTR);

board_placement = create_blank_board_data(board_layout);
//board_placement[3][2] = new TileProperty("tile_0", 1, false);
placement_refreshed = false;