// Check if is clicked or not

if (mouse_check_button_pressed(mb_left)) {
   if (clicked) {
      clicked = false;
   } else if (position_meeting(mouse_x, mouse_y, self)) {
      clicked = true;
   }
}