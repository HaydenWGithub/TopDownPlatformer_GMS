if (objPlayer.y + objPlayer.z > y && objPlayer.y + objPlayer.z < y + sprite_height && objPlayer.x > x && objPlayer.x < x + sprite_width  && objPlayer.z == z)
{
    if (collided == false) {
        collided = true;
        objPlayer.numSlowCollisions++;
    }
}
else {
    if (collided == true) {
        collided = false;
        objPlayer.numSlowCollisions--;
    }
}
