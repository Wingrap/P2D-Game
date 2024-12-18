// DEBUGGING PURPOSES

draw_self();

draw_set_color(c_white); // Set color to white

draw_circle(x, y, interactRange, true); // Draw the range circle
draw_line(x, y, obj_player_new.x, obj_player_new.y); // Draw the collision line

draw_set_color(c_black); // Reset color back to black