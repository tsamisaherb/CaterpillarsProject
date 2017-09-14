/// @description 
leftX = x;
rightX = x+150;
startY = y;
baseMoveSpeed = 2;
diveSpeed = 10;
horizontalDiveRange = 15;
enum state{
	left = 0,
	right = 1,
	diveDownRight = 2,
	diveDownLeft = 3,
	diveUpRight = 4,
	diveUpLeft =5
};
myState = state.left;
cat = o_caterpillar;
