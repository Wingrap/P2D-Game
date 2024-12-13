draw_self();

draw_set_color(c_white);

draw_circle(x, y, interactRange, true);
draw_line(x, y, obj_player_new.x, obj_player_new.y);

draw_set_color(c_black);