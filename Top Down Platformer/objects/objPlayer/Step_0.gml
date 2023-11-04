if (playable){/// @description Controls
var left = keyboard_check(ord("A"));
var right = keyboard_check(ord("D"));
var up = keyboard_check(ord("W"));
var down = keyboard_check(ord("S"));
var jump = keyboard_check_pressed(vk_space);


// The initial depth
//gill will always be rendered on top, unless behind an object
depth = 90;


/*if (y > objDepthAdjust.y && y < objDepthAdjust.y + objDepthAdjust.sprite_height && x > objDepthAdjust.x && x < objDepthAdjust.x + objDepthAdjust.sprite_width) {
	show_debug_message("bummed");
    depth = 800; 
	//visible = false;
	// Sets the player depth when behind the driftwood.
} else {
	depth = 90;
	//visible = true;
    // Reset to default depth (or whatever depth-handling logic you have)
}*/
if (isBehind){
	depth = 800;
}

for (var i = 0; i < array_length(tiles); ++i) {
    var tileZ = (i + 1) * -16;
    
    var bottomCollision = tilemap_get_at_pixel(tiles[i], objPlayer.x, bbox_bottom + ySpeed);
    var leftCollision = tilemap_get_at_pixel(tiles[i], bbox_left, bbox_bottom + ySpeed);
    var rightCollision = tilemap_get_at_pixel(tiles[i], bbox_right, bbox_bottom + ySpeed);
    
    // If there's a collision and the player's z-position is higher than the tile's z-position
    if ((bottomCollision || leftCollision || rightCollision) && z > tileZ) {
		show_debug_message("behind");
		//since Gill is behind, we set it to 600.
		//there is possibility of adding a more complex system to this
		//if we inted to place smaller towers in front of bigger ones
		//but thats a little useless.
		depth = 600;
		show_debug_message(tileZ);
    }
    
}

show_debug_message("depth is currently: ");
show_debug_message(depth);


//Basic x & y Movement and Animation Looping
if (subimg == 3){
	Saved += 100;
	subimg = 0;
}
else{
	//the number that we specify here dictates how fast our animation
	//will go; the higher the number, the slower he moves
	if (counter == 10){
		subimg+=1;
		counter = 0;
	}
	else {
		counter += 1;
	}
}

if (left) {
	xSpeed = -moveSpeed;
	currentSprite = sprLeftSwim;
	if (z < 0){
		currentSprite = sprLeftRun;
	}
	
}
if (right) {
	xSpeed = moveSpeed;
	currentSprite = sprRightSwim;
	if (z < 0){
		currentSprite = sprRightRun;
	}
	
}
if (up) {
	ySpeed = -moveSpeed;
	currentSprite = sprBackSwim;
	if (z < 0){
		currentSprite = sprBackRun;
	}
	
}
if (down) {
	ySpeed = moveSpeed;
	currentSprite = sprFrontSwim;
	if (z < 0){
		currentSprite = sprFrontRun;
	}
	
}

//Stop moving when keys are no longer being pressed
if (!up && !down) {
	ySpeed = 0;
	
}
if (!left && !right) {
	xSpeed = 0;
	
}
if (!up && !down && !left && !right){
	subimg = 0;
}

//Jumping in the z axis
if (jump && zSpeed == 0) {
	zSpeed = jumpSpeed;
}
//Gravity along the z axis
if (z != zFloor) {
	zSpeed += gameGravity;
}
//Snap back to the ground
if (z + zSpeed > zFloor) {
	zSpeed = 0;
	z = zFloor;
}

//Collisions
//We don't need to include z because the script checks it inside
if (PlaceMeeting3D(x + xSpeed, y, objSolid)) {
	//Get as close as possible before stopping
	while(!PlaceMeeting3D(x + sign(xSpeed), y, objSolid)) {
		x += sign(xSpeed);
	}
	xSpeed = 0;
}
if (PlaceMeeting3D(x, y + ySpeed, objSolid)) {
	while(!PlaceMeeting3D(x, y + sign(ySpeed), objSolid)) {
		y += sign(ySpeed);
	}
	ySpeed = 0;
}

//Tile Collisions
//We don't need to include z because the script checks it inside
if (TileMeeting3D(x + xSpeed, y, tiles)) {
	xSpeed = 0;
}
if (TileMeeting3D(x, y + ySpeed, tiles)) {
	ySpeed = 0;
}

//Update zFloor for objects
if (instance_place(x, y, objSolid)) {
	var block = instance_place(x, y, objSolid);
	//If we're higher than the block, send the shadow to the top of that block
	if (block.z >= z) {
		zFloor = block.z;
	}
	//Send shadow to the ground
	else {
		zFloor = 0;
	}
}
//Update the zFloor for tiles
else {
	//Loop through all the tile sets we're colliding with
	for(var i = 0; i < array_length(tiles); ++i) {
		//Check if we collide
		if (tilemap_get_at_pixel(tiles[i], x, y + (i + 1) * -16)) {
			//Update zFloor and stop
			zFloor = (i + 1) * -16;
			break;
		}
		//If no collisions, then we go back to the ground
		else {
			zFloor = 0;
		}
	}
}

//Hit the bottom of a block
if (instance_place(x, y, objSolid)) {
	var block = instance_place(x, y, objSolid);
	//This checks are for making sure we're below the block
	if (block && block.z > z + zSpeed && zFloor >= block.z) {
		if (zSpeed <= 0 && z > block.z) { //z > block.z ensures this change of zSpeed doesn't occur when we're above a block
			zSpeed = gameGravity;
		}
	}
}

//Move us along the axis' by our speeds
x += xSpeed;
y += ySpeed;
z += zSpeed;

if (!externalSpeedSet)
{
    if (numSlowCollisions > 0) {
        moveSpeed = 1;
    }
    else {
        moveSpeed = 3;
    }
}
// Reset the flag for the next frame
externalSpeedSet = false;

isBehind = false;
}