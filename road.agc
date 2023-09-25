global road1,road2 as integer
global YRoad1,YRoad2 as integer
global grass1 as integer[8]
global grass2 as integer[8]

function createRoad()
	imgRoad = LoadImage("images/road.png")
	//posisi Y
	YRoad1 = 0
	YRoad1 = - GetVirtualHeight()
	
	//make move road
	road1 = CreateSprite(imgRoad)
	setSpriteSize(road1,GetVirtualWidth()-150,GetVirtualHeight())
	SetSpritePosition(road1,(GetVirtualWidth()-GetSpriteWidth(road1))/2,Yroad1)
	
	road2 = CreateSprite(imgRoad)
	setSpriteSize(road2,GetVirtualWidth()-150,GetVirtualHeight())
	SetSpritePosition(road2,(GetVirtualWidth()-GetSpriteWidth(road2))/2,Yroad2)

endfunction

function moveRoad()
	YRoad1 = YRoad1 + 5
	YRoad2 = YRoad2 + 5
	
	//mengembalikan ke posisi semula
	if YRoad2 = 0 then YRoad1 = -GetSpriteHeight(road1)
	if YRoad1 = 0 then YRoad2 = -GetSpriteHeight(road2)
	
	//bergerak / update position sprite
	SetSpritePosition(road1,(GetVirtualWidth()-GetSpriteWidth(road1))/2,YRoad1)
	SetSpritePosition(road2,(GetVirtualWidth()-GetSpriteWidth(road2))/2,YRoad2)
endfunction

function createGrass()
	imgGrass = LoadImage("images/grass.png")
	
	for i = 0 to 7
		grass1[i] = CreateSprite(imgGrass)
		SetSpriteSize(grass1[i],75,80)
		SetSpritePosition(grass1[i],0,GetSpriteHeight(grass1[i])*i)
		
		grass2[i] = CreateSprite(imgGrass)
		SetSpriteSize(grass2[i],75,80)
		SetSpriteFlip(grass2[i],1,0)
		SetSpritePosition(grass2[i],GetVirtualWidth()-75,GetSpriteHeight(grass2[i])*i)
	next i
endfunction

//legakan
global sPlosion as integer

function createExplosion()
	imgExplosion = LoadImage("images/explosion.png")
	sPlosion = CreateSprite(imgExplosion)
	SetSpriteAnimation(sPlosion,256,251,32)
	PlaySprite(sPlosion,100,1,2,32)
	SetSpriteShape(sPlosion,3)
	SetSpriteVisible(sPlosion,0)
endfunction
