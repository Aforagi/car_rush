TYPE Player
	ID as integer
	X as integer
	Y as integer
	
	Width as integer
	Height as integer
	
	Life as integer
ENDTYPE

global g_player as Player

function createPlayer()
	imgMobil = LoadImage("images/car3.png")
	
	g_player.ID = CreateSprite(imgMobil)
	g_player.X = (GetVirtualWidth()-GetSpriteWidth(g_player.ID))/2 + 20
	g_player.Y = GetVirtualHeight()-GetSpriteHeight(g_player.ID)-10
	g_player.Life = 3
	
	SetSpriteSize(g_player.ID,50,100)
	SetSpritePosition(g_player.ID,g_player.X,g_player.Y)
	SetSpriteShape(g_player.ID,3)
endfunction

function movePlayer()
	g_player.X = g_player.X + (GetJoystickX()*6)
	g_player.Y = g_player.Y + (GetJoystickY()*6)
	
	if g_player.X < GetSpriteX(road1) then g_player.X = GetSpriteX(road1)
	if g_player.X > GetSpriteX(road1) + GetSpriteWidth(road1)-GetSpriteWidth(g_player.ID)
		g_player.X = GetSpriteX(road1)+GetSpriteWidth(road1)-GetSpriteWidth(g_player.ID)
	endif
	if g_player.Y < 280 then g_player.Y = 280
	
	SetSpritePosition(g_player.ID,g_player.X,g_player.Y)
endfunction

function resetPlayer()
	g_player.X = (GetVirtualWidth()-GetSpriteWidth(g_player.ID))/2 + 20
	g_player.Y = GetVirtualHeight()-GetSpriteHeight(g_player.ID)-10
	SetSpritePosition(g_player.ID,g_player.X,g_player.Y)
endfunction
