/// @description Insert description here
// You can write your code in this editor
collided = false;


//collide with player
//this is a proprietary collision system that factors in the z axis
//hence why we cant simply use the collision event
if (objPlayer.y + objPlayer.z > y && objPlayer.y + objPlayer.z < y + sprite_height && objPlayer.x > x && objPlayer.x < x + sprite_width  && objPlayer.z == z)
{
	collided = true;
	objPlayer.moveSpeed = 0;
	Wall.wallSpeed = 0;
	objPlayer.externalSpeedSet = true;
}
