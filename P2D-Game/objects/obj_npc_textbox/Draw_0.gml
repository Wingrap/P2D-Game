draw_sprite(spr_textbox_test, 0, x,y);

draw_set_font(fnt_textbox);

draw_set_color(c_white);

var spriteWidth = sprite_get_width(spr_textbox_test);
var spriteHeight = sprite_get_height(spr_textbox_test);

// Calculate the top-left position
var topLeftX = x - spriteWidth / 2;
var topLeftY = y - spriteHeight / 2;

draw_text_ext(topLeftX + 4,topLeftY + 4, text, stringHeight / 1.2, boxWidth);

draw_set_color(c_black);

draw_set_font(fnt_default);