/// @description Insert description here
// You can write your code in this editor
movesp = 6;
hsp=0;
foot_pos = 50;
heldObj = noone//instance_create_depth(x,y+foot_pos,-1,o_emptyHoldingObject);
pickUpRange = 30;
canPickUp = false;
//heldObj.sprite_index = spriteNames[itemCounter];
//heldObj.physicsActive=false;
itemReloadTime=40;
lastObjNearestPickUp = noone;
heldObjectIndex = noone;
instance_create_depth(x,y+foot_pos,1,o_emptyHoldingObject);

