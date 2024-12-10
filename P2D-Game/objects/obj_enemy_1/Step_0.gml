#region Movement & Shooting

// Distance between the enemy and the player
var dist = point_distance(x, y, obj_player_new.x, obj_player_new.y); 

// A line between 2 objects that checks if there is collision
var hit = collision_line(x, y, obj_player_new.x, obj_player_new.y, collideWith, false, true);

// The distance between the player and enemy is smaller than the shootRange 
// and the line is detecting a collision with no other collision in between
if(dist <= shootRange && !hit)
{
		// Stop moving
		x += 0; 
	
	    // Check if cooldown allows shooting
	    if (shootCooldown <= 0) {
		    var bullet = instance_create_layer(x, y, "Instances", obj_bullet_enemy); // Create bullets
		    bullet.direction = point_direction(x, y, obj_player_new.x, obj_player_new.y); // Bulet direction
		    bullet.speed = bulletSpeed; // Bullet speed
		
			shootCooldown = shootCooldownMax; // Set cooldown back to max
		}
}
else
{
	// Movement
	var groundCheckLeftX = x - sprite_width;
	var groundCheckRightX = x + sprite_width;
	var groundCheckY = y + sprite_height / 2 + 2;
	
	// Collision detection
	var onGroundLeft = place_meeting(groundCheckLeftX, groundCheckY, collideWith);
	var onGroundRight = place_meeting(groundCheckRightX, groundCheckY, collideWith);

	// Go either left or right
	if (!onGroundLeft || !onGroundRight) {
	    if (!onGroundLeft) {
	        dir = 1;
	    }
	    if (!onGroundRight) {
	        dir = -1;
	    }
	}

	// Apply the movement
	x += dir * movementSpeed;
}

if (shootCooldown > 0) {
    shootCooldown -= 1; // Decrement the cooldown
}

#endregion

#region Health System

// If health is equal or lower than 0, destroy objects
if (hp <= 0)
{
	instance_destroy();	
}

#endregion