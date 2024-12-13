var interactKey = keyboard_check_pressed(ord("E"));

// Distance between the enemy and the player
var dist = point_distance(x, y, obj_player_new.x, obj_player_new.y); 

// A line between 2 objects that checks if there is collision
var hit = collision_line(x, y, obj_player_new.x, obj_player_new.y, collideWith, false, true);

// The distance between the player and enemy is smaller than the interactRange 
// and the line is detecting a collision with no other collision in between
if(dist <= interactRange && !hit)
{
	if(interactKey)
	{
		//show_debug_message("YOU ARE INTERACTING WITH NPC");
		if(!instance_exists(obj_npc_textbox))
		{
			var textBox = instance_create_layer(x, y -90, "Instances", obj_npc_textbox);	 // Create textbox
			textBox.text = myText; // Set the text
			textBox.name = myName; // Set the name
		}
		else if(instance_exists(obj_npc_textbox)) // If you press interactKey when the textbox is open, destroy textbox
		{
			instance_destroy(obj_npc_textbox);	
		}


	}
}
else if (dist >= interactRange) // If you walk out of the distance, destroy textbox
{
	if(instance_exists(obj_npc_textbox))
	{
		instance_destroy(obj_npc_textbox);	
	}
}