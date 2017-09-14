/// @description Insert description here
// You can write your code in this editor
key_up = keyboard_check(vk_up);
key_right = keyboard_check(vk_right);
key_left = keyboard_check(vk_left);
key_down = keyboard_check(vk_down);
key_interact_item = keyboard_check_pressed(vk_space);
//key_change_item = keyboard_check_pressed(vk_tab);

if(heldObj = noone)
{
	objNearestPickUp = instance_nearest(x,y+foot_pos,PickUp_Parent);
		if(point_distance(objNearestPickUp.x,objNearestPickUp.y,x,y+foot_pos)<pickUpRange)
		{
			//assign effect to nearest pick up;
			canPickUp = true;
			//flash it to indicate its closest
			if(objNearestPickUp.alphaDropping)
			{
				objNearestPickUp.image_alpha -= .1;
				if(objNearestPickUp.image_alpha <=0)
				{
					objNearestPickUp.image_alpha = 0;
					objNearestPickUp.alphaDropping=false;
				}
			}
			else
			{
				objNearestPickUp.image_alpha += .1;
				if(objNearestPickUp.image_alpha >=1)
				{
					objNearestPickUp.image_alpha = 1;
					objNearestPickUp.alphaDropping=true;
				}
			}
		}
		else
		{
			canPickUp = false;
			objNearestPickUp = noone;
		}
}
//if you have an object this is always no one
else
{
	objNearestPickUp = noone;
}

if(key_interact_item)
{
	//pick up an item
	if(heldObj==noone)
	{
		//check if you can pick something up
		if(canPickUp)
		{
			//assign empty object (no physics) to the picked up sprite, and deactivate old object
			o_emptyHoldingObject.sprite_index = objNearestPickUp.sprite_index;
			heldObj = objNearestPickUp;
			//heldObj = o_emptyHoldingObject;
			o_emptyHoldingObject.x=x;
			o_emptyHoldingObject.y=y+foot_pos;
			instance_deactivate_object(objNearestPickUp);
		}
	}
	//drop an item
	else
	{
		//assign empty object to no sprite, and reactive item
		o_emptyHoldingObject.sprite_index=-1;
		instance_activate_object(heldObj);
		heldObj = heldObj;
		heldObj.x = x;
		heldObj.y = y+foot_pos;
		//heldObj.sprite_index = -1;
		//var newObj = instance_create_depth(x,y+foot_pos,-1,heldItem);
		if(heldObj == o_dropWall)
		{
			heldObj.grv = .6;
		}
		//heldObj=noone;
		//alarm_set(0,itemReloadTime);
		//heldObj = instance_create_depth(x,y+foot_pos,-1,heldItem);
		heldObj.physicsActive=true;
		heldObj = noone;
	}
}

//this means obj changed between then and now;
if(lastObjNearestPickUp!=noone && lastObjNearestPickUp!=objNearestPickUp && !canPickUp)
{
	if(lastObjNearestPickUp)
	{
		//reset the last objs alpha to 1
		lastObjNearestPickUp.alphaDropping=false;
		lastObjNearestPickUp.image_alpha=1;
	}
}
//and now reassign the last obj after all the logic is done
lastObjNearestPickUp = objNearestPickUp;

if(key_right)
{
	hsp=movesp;
}
else if (key_left)
{
	hsp = -movesp;
}
else
{
	hsp=0;
}

if place_meeting(x+hsp,y,o_wall)
{
    if place_meeting(x+hsp,y,o_wall)
    {
        while (!place_meeting(x+sign(hsp),y,o_wall)) x+=sign(hsp);
        hsp = 0;
    }
}
x += hsp;
if(heldObj!=noone)
{
	heldObj.x +=hsp;
	o_emptyHoldingObject.x+=hsp;
}


if(key_up)
{
	vsp = -movesp;
}
else if (key_down)
{
	vsp = movesp;
}
else
{
	vsp=0;
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

y+=vsp;
if(heldObj!=noone)
{
	heldObj.y+=vsp;
	o_emptyHoldingObject.y+=vsp;
}