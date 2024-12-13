// DEBUGGING PURPOSES

draw_self();

draw_set_color(c_white);

draw_circle(x, y, shootRange, true);
draw_line(x, y, obj_player_new.x, obj_player_new.y);

//var groundCheckLeftX = x - sprite_width;
//var groundCheckRightX = x + sprite_width;
//var groundCheckY = y + sprite_height / 2 + 2;

//draw_set_color(c_red);
//draw_circle(groundCheckLeftX, groundCheckY, 1, false);
//draw_circle(groundCheckRightX, groundCheckY, 1, false);

draw_set_color(c_black);