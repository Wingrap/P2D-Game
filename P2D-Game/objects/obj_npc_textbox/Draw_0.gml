// Draw textbox
draw_sprite(spr_textbox_test, 0, x,y);

// Set font
draw_set_font(fnt_textbox);

// Get sprite width and height
var spriteWidth = sprite_get_width(spr_textbox_test);
var spriteHeight = sprite_get_height(spr_textbox_test);

// Calculate the top-left position
var topLeftX = x - spriteWidth / 2;
var topLeftY = y - spriteHeight / 2;

// Increase character counter 
if(charCount < string_length(text[page]))
{
	charCount += 1;
}

// Copy part of the text
var textPart = string_copy(text[page], 1, charCount);

// Draw the name;
draw_set_color(c_green); // ONLY CHANGE THIS
draw_set_halign(fa_center);
draw_text(topLeftX + boxWidth/2, topLeftY, name);
draw_set_halign(fa_left);

// Draw the part of the text
draw_set_color(c_white);
draw_text_ext(topLeftX + xOffset, topLeftY + stringHeight, textPart, stringHeight / 1.2, boxWidth);

// Set color back
draw_set_color(c_black);

// Set font back
draw_set_font(fnt_default);