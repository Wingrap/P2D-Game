horizontalSpeed = 0; // Horizontal speed
verticalSpeed = 0; // Vertical speed

accel = 0.5; // Acceleration
decel = 0.3; // Decelaration

grav = 0.5; // Gravity
horizontalSpeedMax = 5; // max horizontal speed

groundBuffer = 4; // Lets us jump if we are atleast 12 pixels close
jumpHeight = -12; // jump height
doubleJumpHeight = -10; // double jump height
jumpBuffer = 10; // Frames after leaving ground when we can still jump
canDoubleJump = true; // Check if you can double jump or not

layerID = layer_tilemap_get_id("Tiles_1"); // Tilemap ID
collideWith = [layerID]; // What to collide with