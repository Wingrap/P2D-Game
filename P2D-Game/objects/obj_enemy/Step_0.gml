var groundCheckLeftX = x - sprite_width;
var groundCheckRightX = x + sprite_width;
var groundCheckY = y + sprite_height / 2 + 2;

var onGroundLeft = place_meeting(groundCheckLeftX, groundCheckY, collideWith);
var onGroundRight = place_meeting(groundCheckRightX, groundCheckY, collideWith);

if (!onGroundLeft || !onGroundRight) {
    if (!onGroundLeft) {
        dir = 1;
    }
    if (!onGroundRight) {
        dir = -1;
    }
}

x += dir * movementSpeed;

show_debug_message("Direction: " + string(direction));
show_debug_message("Enemy X: " + string(x) + " Y: " + string(y));

if (hp <= 0)
{
	instance_destroy();	
}