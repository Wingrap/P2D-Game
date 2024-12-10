// Movement
movementSpeed = 1;
dir = 1;

// Shooting
shootRange = 100;
shootCooldownMax = 10; 
shootCooldown = 0; 
bulletSpeed = 10;

// Collision
layerID = layer_tilemap_get_id("Tiles_1");
collideWith = [layerID];

// Health
hp = 100;