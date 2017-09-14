/// @description Insert description here
hsp = 0;
vsp = 0;
//determine how to move
if(myState == state.right)
{
	//check if you should be diving
	if(abs(x-cat.x)<=horizontalDiveRange)
	{
		//transition to diveDown Right;
		if(x<cat.x)
		{
			myState = state.diveDownRight;
			//image_xscale=1;
			image_angle=270;
		}
		//transition to dive down left
		else
		{
			myState = state.diveDownLeft;
			//image_xscale=1;
			image_angle = 270;
		}
	}
	//otherwise move right
	else
	{
		if(x+baseMoveSpeed>rightX)
		{
			hsp = 0;
			x = rightX;
			myState = state.left;
			image_angle = 0;
			image_xscale=1;
		}
		else
		{
			hsp = baseMoveSpeed;
		}
	}
}
else if (myState == state.left)
{
	//check if you should be diving
	if(abs(x-cat.x)<=horizontalDiveRange)
	{
		//transition to diveDown Right;
		if(x<cat.x)
		{
			myState = state.diveDownRight;
			image_angle=90;
		}
		//transition to dive down left
		else
		{
			myState = state.diveDownLeft;
			image_angle = 90;
		}
	}
	//otherwise move left
	else
	{
		if(x-baseMoveSpeed<leftX)
		{
			hsp = 0;
			x = leftX;
			myState = state.right;
			image_angle = 0;
			image_xscale = -1;
		}
		else
		{
			hsp = -baseMoveSpeed;
		}
	}
}
else if (myState == state.diveDownRight)
{
	vsp = diveSpeed;
	hsp = baseMoveSpeed;
	//if you hit the floor come back up
	if(place_meeting(x+hsp,y+vsp,o_wall))
	{
		myState = state.diveUpRight;
		image_angle=270;
		vsp =0;
		hsp = 0;
	}
}
else if (myState == state.diveDownLeft)
{
	vsp = diveSpeed;
	hsp = -baseMoveSpeed;
	//if you hit the floor come back up
	if(place_meeting(x+hsp,y+vsp,o_wall))
	{
		myState = state.diveUpLeft;
		image_angle=270;
		vsp =0;
		hsp = 0;
	}
}
else if (myState == state.diveUpRight)
{
	vsp = -diveSpeed;
	hsp = baseMoveSpeed;
	if(y+vsp<startY)
	{
		y = startY;
		myState = state.right;	
		image_angle = 0;
		image_xscale = -1;
	}
}
else if (myState == state.diveUpLeft)
{
	vsp = -diveSpeed;
	hsp = -baseMoveSpeed;
	if(y+vsp<startY)
	{
		y = startY;
		myState = state.left;	
		image_angle = 0;
		image_xscale = 1;
	}
}


x+=hsp;
y+=vsp;
