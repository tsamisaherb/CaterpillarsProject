/// @description Insert description here
// You can write your code in this editor
if(physicsActive){
	vsp+=grv;
	if(place_meeting(x,y+vsp,o_wall))
	{	
		while(!place_meeting(x,y+sign(vsp),o_wall))
		{
			y+=sign(vsp);
		}
		vsp=0;
	}
	y+=vsp;
}