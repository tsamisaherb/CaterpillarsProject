/// @description Insert description here
// You can write your code in this editor

hsp = walksp*facing;
vsp+=grv;
//horizontal collision
if place_meeting(x+hsp,y,o_wall)  && !place_meeting(x+hsp,y,o_leaf)
{
   //Ramp code
   yplus = 0;
   while (place_meeting(x+hsp,y-yplus,o_wall) && yplus <= abs(2*hsp)) yplus += 1;
    if place_meeting(x+hsp,y-yplus,o_wall)
    {
        while (!place_meeting(x+sign(hsp),y,o_wall)) x+=sign(hsp);
        hsp = 0;
		Hit_Wall();
    }
    else
    {
        y -= yplus
    }
}
if(canMove)
{
	x += hsp;
}
if(place_meeting(x,y,o_berry))
{
	var thisBerry = instance_place(x,y,o_berry);
	//set new checkpoint
	checkPointX = thisBerry.x;
	checkPointY = thisBerry.y;
	//destroy berry
	thisBerry.alarm[0]=15;
	thisBerry.isUsed = true;
}

//vertical collision
if(place_meeting(x,y+vsp,o_wall))
{	
	while(!place_meeting(x,y+sign(vsp),o_wall))
	{
		y+=sign(vsp);
	}
	vsp=0;
}

if(place_meeting(x,y+1,o_leaf))
{
	vsp = -leafAmt;
}

if(canMove)
{
	y+=vsp;
}
if(place_meeting(x,y+1,o_water))
{
	if(canMove){
		canMove = false;
		alarm_set(0,respawnTimer);
		//and then make the egg
		var newEgg = instance_create_depth(checkPointX,checkPointY,0,o_egg);
		newEgg.alarm[0]=respawnTimer;
	}
}
if(place_meeting(x,y,o_bird))
{
	if(canMove)
	{
		canMove = false;
	}
		alarm_set(0,respawnTimer);
		//and then make the egg
		var newEgg = instance_create_depth(checkPointX,checkPointY,0,o_egg);
		newEgg.alarm[0]=respawnTimer;
}