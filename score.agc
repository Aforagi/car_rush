global score as integer = 0
global tScore,tLife as integer

function createScore()
	imgBgScore = LoadImage("images/bgScore.png")
	imgHeart = LoadImage("images/heart.png")
	imgStar = LoadImage("images/star.png")
	
	//Score
	bgScore = CreateSprite(imgbgScore)
	SetSpriteSize(bgScore,75,35)
	SetSpritePosition(bgScore,GetSpriteX(road1)+25,10)
	
	iScore = CreateSprite(imgStar)
	SetSpriteSize(iScore,32,32)
	SetSpritePosition(iScore,GetSpriteX(road1)+10,10)
	
	//life Player
	bgLife = CreateSprite(imgBgScore)
	SetSpriteSize(bgLife,75,35)
	SetSpritePosition(bgLife,GetSpriteX(road1)+240,10)
	
	iLife = CreateSprite(imgHeart)
	SetSpriteSize(iLife,32,32)
	SetSpritePosition(iLife,GetSpriteX(road1)+225,10)
	
	//set text
	tScore = CreateText(str(score))
	SetTextSize(tScore,32)
	SetTextPosition(tScore,GetSpriteX(iScore)+50,10)
	SetTextColor(tScore,0,0,0,255)
	
	tLife = CreateText(str(g_player.Life))
	SetTextSize(tLife,32)
	SetTextPosition(tLife,GetSpriteX(iLife)+50,10)
	SetTextColor(tLife,0,0,0,225)
endfunction

function updatePoint()
	if GetSpriteCollision(g_player.ID,g_point[cPoint].ID) = 1
		
		PlaySound(sPoint)
		
		score = score + g_point[cPoint].Score
		SetTextString(tScore,str(score))
		showPoint(Random(0,2))
	endif
endfunction

function updateLife()
	if GetSpriteCollision(g_player.ID,g_enemy[cEnemy].ID) = 1
		
		Repeat
			SetSpritePosition(sPlosion,g_player.X - 90,g_player.Y-70)
			SetSpriteVisible(sPlosion,1)
			Sync()
		until Timer() > 3
		
		PlaySound(sExplosion)
		//reset nyawa
		g_player.Life = g_player.Life - 1
		SetTextString(tLife,str(g_player.Life))
		
		if g_player.Life = 0 then gameover = 1
		showEnemy(Random(0,1))
		resetPlayer()
		SetSpriteVisible(sPlosion,0)
		ResetTimer()
	endif
endfunction
