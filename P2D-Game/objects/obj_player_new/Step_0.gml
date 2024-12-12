#region Variables

// Check if you are grounded
var isGrounded = place_meeting(x, y + groundBuffer, collideWith); 

// Movement Controls
var leftKey = keyboard_check(ord("A")); // Go left key
var rightKey = keyboard_check(ord("D")); // Go right key
var jumpKey = keyboard_check_pressed(vk_space); // Jump up key
var dashKey = keyboard_check_pressed(ord("Q")); // Dash left OR right key
var sprintKey = keyboard_check(vk_shift); // Sprint key

// ? is the If and : is the Else
var sprintMultiplier = (sprintKey ? 2 : 1); // Increase speed when sprinting
// So it is the same as this: 
/*
if (sprintKey) {
    sprintMultiplier = 2;
} else {
    sprintMultiplier = 1;
}
*/


#endregion

#region Horizontal Movement
// Get move direction
var dir = rightKey - leftKey;

// Check if you are dashing
if (canDash && dashKey) 
{
	canDash = false; // Set canDash to false
	dashTime = dashDuration;  // Set the dash time
	
	dashDir = sign(horizontalSpeed); // Direction of dash
	
	horizontalSpeed += dashSpeed * dashDir; // Apply the dash speed in the correct direction
	
}

if (dashTime > 0) { // If dashTime is bigger than 0
    dashTime -= 1; // Reduce dash time

    var dashFactor = dashTime / dashDuration; // Calculate the remaining time as a factor of the total dash duration
    horizontalSpeed = lerp(horizontalSpeed, dashSpeed * dashDir, dashFactor * 0.1); // Smoothly transition to horizontal speed to dash speed
}
else
{
	// Change horizontal speed depending on the direction and acceleration
	horizontalSpeed += dir * accel * sprintMultiplier;
	
	if(dir == 0) // No direction
	{
		if(horizontalSpeed < 0) // Left
		{
			horizontalSpeed = min(horizontalSpeed + decel, 0); // Reduce speed, but dont go past 0
		} else // Right
		{
			horizontalSpeed = max(horizontalSpeed - decel, 0); // Reduce speed, but dont go past 0
		}
	}

	// Limit the horizontal speed so it stays within the maximum
	horizontalSpeed = clamp(horizontalSpeed, -horizontalSpeedMax * sprintMultiplier, horizontalSpeedMax * sprintMultiplier); // Max speed
}

#endregion

#region Vertical Movement
// Add gravity
verticalSpeed += grav;

// Jumping 
if(jumpBuffer > 0) // Checks if the jumpbuffer is greater than 0
{
    jumpBuffer--; // Reduces jumpbuffer by 1 each step
    if(jumpKey && verticalSpeed > 0) // Presses jump key and player not grounded
    {
        jumpBuffer = 0; // Set jumpBuffer to 0
        verticalSpeed = jumpHeight; // Jump up
        canDoubleJump = true; // Enable double jump 
    }
}
else if(canDoubleJump && jumpKey) // If the player hasn't double jumped yet
{
    verticalSpeed = doubleJumpHeight; // Jump up AGAIN
    canDoubleJump = false; // Disable double jump
}

if(isGrounded) // Check if you are grounded
{
    jumpBuffer = 10; // Reset jump buffer value when grounded
    canDoubleJump = true;// Enable double jump 
	canDash = true; // You can dash again
}

#endregion

#region Collisions

// Horizontal collision
// Check if there is collision on the X axis
if(place_meeting(x + horizontalSpeed, y, collideWith))
{
	var xx = round(x); // Round the current x position to a whole number 
	var pixel = sign(horizontalSpeed); // Direction to move (left or right) depending on the movement speed
	
	// Keep moving one pixel until there is collision
	while(!place_meeting(xx + pixel, y, collideWith))
	{
		xx += pixel; // Adjust position by one pixel
	}
	
	x = xx; // Set the X position to the last valid position before collision
	horizontalSpeed = 0; // Stop horizontal speed because there is collision detected
}

// Commit movement
x += horizontalSpeed;

// Vertical collision
// Check if there is collision on the Y axis
if(place_meeting(x, y + verticalSpeed, collideWith))
{
	var yy = round(y); // Round the current x position to a whole number 
	var pixel = sign(verticalSpeed); // Direction to move (left or right) depending on the movement speed
	
	// Keep moving one pixel until there is collision
	while(!place_meeting(x, yy + pixel, collideWith))
	{
		yy += pixel; // Adjust position by one pixel
	}
	
	y = yy; // Set the Y position to the last valid position before collision
	verticalSpeed = 0; // Stop horizontal speed because there is collision detected
}

// Commit movement
y += verticalSpeed;

#endregion

#region Camera

// Get the current camera position
var camX = camera_get_view_x(view_camera[0]);
var camY = camera_get_view_y(view_camera[0]);

// Calculate the target position for the camera
var targetX = x - (camera_get_view_width(view_camera[0]) / 2);
var targetY = y - (camera_get_view_height(view_camera[0]) / 2);

// Smoothly move the camera towards the target position
camX = lerp(camX, targetX, 0.1); // Adjust 0.1 for smoothness
camY = lerp(camY, targetY, 0.1); // Adjust 0.1 for smoothness

// Update the camera its position with the new values
camera_set_view_pos(view_camera[0], camX, camY);

#endregion

#region Health System

// Respawn System
if(hp <= 0) // if hp is equal or lower than 0
{
	instance_destroy();	// Destroy old player
	instance_create_layer(originalX, originalY, "Instances", obj_player_new); // Spawn new player
}

#endregion