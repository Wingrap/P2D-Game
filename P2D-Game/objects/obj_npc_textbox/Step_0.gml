var nextTextKey = keyboard_check_pressed(vk_enter);

if(nextTextKey)
{	
	if(charCount < string_length(text[page])) // Set charCount to the text length
	{
		charCount = string_length(text[page]);	
	}
	else if(page+1 < array_length(text)) // Only increase page, if page + 1, is less than the total number of entries
	{
		page += 1;
		charCount = 0;
	} 
	else
	{
		instance_destroy();
	}
}