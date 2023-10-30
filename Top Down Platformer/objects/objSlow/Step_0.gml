/// @description Insert description here
// You can write your code in this editor
//record the movement speed of the player currently
if (!collided){
	playerSpeed = objPlayer.moveSpeed;
}


//collide with player
//this is a proprietary collision system that factors in the z axis
//hence why we cant simply use the collision event
if (objPlayer.y + objPlayer.z > y && objPlayer.y + objPlayer.z < y + sprite_height && objPlayer.x > x && objPlayer.x < x + sprite_width  && objPlayer.z == z)
{
	collided = true;
	objPlayer.moveSpeed = 1;
	
}
else {
	collided = false;
	objPlayer.moveSpeed = playerSpeed;
}

