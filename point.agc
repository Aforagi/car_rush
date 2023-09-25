TYPE Point
	ID as integer
	Width as integer
	Height as integer
	X as integer
	Y as integer
	Score as integer
	Speed as integer
ENDTYPE
global g_point as point[2] //Sprite
global imgPoint as integer[2] //load image
global IsPoint as string[2] = ["images/Jelly1.png","images/Jelly2.png","images/Jelly3.png"] //Filename
global cPoint as integer

function createPoint()
	for i = 0 to 2
		imgPoint[i] = LoadImage(IsPoint[i])
		g_point[i].ID = CreateSprite(imgPoint[i])
		g_point[i].Width = 50
		g_point[i].Height = 40
		g_point[i].Score = (i*2) + 10
		
		SetSpriteSize(g_point[i].ID,g_point[i].Width,g_point[i].Height)
		SetSpriteVisible(g_point[i].ID,0)
		
		SetSpriteShape(g_point[i].ID,3)
	next i
endfunction

function showPoint(id as integer)
	resetPoint()
	
	cPoint = id
	g_point[id].X = Random(GetSpriteX(road1)+5,GetSpriteX(road1)+GetSpriteWidth(road1)-g_point[id].Width)
	g_point[id].Y = 0
	g_point[id].Speed = Random(6,10)
	SetSpritePosition(g_point[id].ID,g_point[id].X,g_point[id].Y)
	SetSpriteVisible(g_point[id].ID,1)
endfunction

function movePoint()
	g_point[cPoint].Y = (g_point[cPoint].Y + g_point[cPoint].Speed)
	if g_point[cPoint].Y > GetVirtualHeight() then showPoint(Random(0,2))
	SetSpritePosition(g_point[cPoint].ID,g_point[cPoint].X,g_point[cPoint].Y)
endfunction

function resetPoint()
	for i = 0 to 2
		g_point[i].Y = 0
		g_point[i].X = 0
		SetSpritePosition(g_point[i].ID,g_point[i].X,g_point[i].Y)
		SetSpriteVisible(g_point[i].ID,0)
	next i
endfunction

