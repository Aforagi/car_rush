TYPE Enemy
	ID as integer
	Width as integer
	Height as integer
	X as integer
	Y as integer
	Speed as integer
ENDTYPE

global g_enemy as Enemy[1]
global cEnemy as integer

function createEnemy()
	imgBarel = LoadImage("images/barrel.png")
	imgBlock = LoadImage("images/roadblock.png")
	
	//sprite barrel
	g_enemy[0].ID = CreateSprite(imgBarel)
	g_enemy[0].Width = 70
	g_enemy[0].Height = 80
	SetSpriteSize(g_enemy[0].ID,g_enemy[0].Width,g_enemy[0].Height)
	SetSpriteVisible(g_enemy[0].ID,0)
	
	SetSpriteShape(g_enemy[0].ID,3)
	
	//sprite Block
	g_enemy[1].ID = CreateSprite(imgBlock)
	g_enemy[1].Width = 120
	g_enemy[1].Height = 60
	SetSpriteSize(g_enemy[1].ID,g_enemy[1].Width,g_enemy[1].Height)
	SetSpriteVisible(g_enemy[1].ID,0)
	
	SetSpriteShape(g_enemy[1].ID,3)
endfunction

function showEnemy(id as integer)
	resetEnemy()
	
	cEnemy = id
	g_enemy[id].X = Random(GetSpriteX(road1)+5,GetSpriteX(road1)+GetSpriteWidth(road1)-g_enemy[id].Width)
	g_enemy[id].Y = 0
	g_enemy[id].Speed = Random (5,6)
	SetSpritePosition(g_enemy[id].ID,g_enemy[id].X,g_enemy[id].Y)
	SetSpriteVisible(g_enemy[id].ID,1)
endfunction

function moveEnemy()
	if Random(0,50) = 10
		g_enemy[cEnemy].X = Random(GetSpriteX(road1)+5,GetSpriteX(road1)+GetSpriteWidth(road1)-g_enemy[cEnemy].Width)
	endif
	g_enemy[cEnemy].Y = g_enemy[cEnemy].Y + g_enemy[cEnemy].Speed
	if g_enemy[cEnemy].Y > GetVirtualHeight()+5 then showEnemy(Random(0,1))
	SetSpritePosition(g_enemy[cEnemy].ID,g_enemy[cEnemy].X,g_enemy[cEnemy].Y)
endfunction

function resetEnemy()
	for i = 0 to 1
		g_enemy[i].Y = 0
		g_enemy[i].X = 0
		SetSpritePosition(g_enemy[i].ID,g_enemy[i].X,g_enemy[i].Y)
		SetSpriteVisible(g_enemy[i].ID,0)
	next i
endfunction
