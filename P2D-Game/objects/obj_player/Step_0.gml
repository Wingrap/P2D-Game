#region Player Movement

// Movement Controls
var leftKey = keyboard_check(ord("A"));
var rightKey = keyboard_check(ord("D"));
var jumpKey = keyboard_check_pressed(vk_space);

// Collisions
var onGround = place_meeting(x, y+2, collideWith);
var onWall = place_meeting(x-5, y, collideWith) || place_meeting(x+5, y, collideWith);

moveX = rightKey - leftKey;
moveX *= movementSpeed;

// Check if you are on ground
if (onGround) 
{
    moveX = (rightKey - leftKey) * movementSpeed;
	canDoubleJump = true;
} else
{
	// Air control
    var airAcceleration = 1; 
    if (rightKey) moveX = clamp(moveX + airAcceleration, -movementSpeed, movementSpeed);
    if (leftKey) moveX = clamp(moveX - airAcceleration, -movementSpeed, movementSpeed);
}

// Jumping
if (jumpKey) 
{
    if (onGround) 
	{
		moveY = -jumpForce;
    } else if (onWall) 
	{
		moveY = -15;
		moveX = onWall * movementSpeed;
    } else if (canDoubleJump) 
	{
        moveY = -jumpForce; 
        canDoubleJump = false; 
    } else if (moveY < 10)
	{
		moveY += 1;
	}
}

var grav = 1; 
if (moveY < 10)
{
    moveY += grav;
}

// Apply movements
move_and_collide(moveX, moveY, collideWith);



#endregion

#region Camera Stuff

var camX = camera_get_view_x(view_camera[0]);
var camY = camera_get_view_y(view_camera[0]);

var targetX = x - (camera_get_view_width(view_camera[0]) / 2);
var targetY = y - (camera_get_view_height(view_camera[0]) / 2);

camX = lerp(camX, targetX, 0.1); // Adjust 0.1 for smoothness
camY = lerp(camY, targetY, 0.1); // Adjust 0.1 for smoothness

camera_set_view_pos(view_camera[0], camX, camY);
#endregion

#region Gun
var shootKey = mouse_check_button(mb_left);

if(shootKey)
{
	if(shootCooldown <= 0)
	{
		var bullet = instance_create_layer(x, y, "Instances", obj_bullet);
		bullet.speed = bulletSpeed;	
		bullet.direction = point_direction(x, y, mouse_x, mouse_y);
		
		shootCooldown = shootCooldownMax
	}
}

if(shootCooldown > 0)
	shootCooldown -= 1;	

#endregion