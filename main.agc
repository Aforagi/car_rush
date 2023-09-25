
// Project: Car Rush 
// Created: 2021-07-08

// show all errors
SetErrorMode(2)

// set window properties
SetWindowTitle( "Car Rush" )
SetWindowSize( 480, 640, 0 )
SetWindowAllowResize( 1 ) // allow the user to resize the window

// set display properties
SetVirtualResolution( 480, 640 ) // doesn't have to match the window
//SetVirtualResolution( GetDeviceWidth(), GetDeviceHeight() )
SetOrientationAllowed( 1, 1, 0, 0 ) // allow both portrait and landscape on mobile devices
SetSyncRate( 30, 0 ) // 30fps instead of 60 to save battery
SetScissor( 0,0,0,0 ) // use the maximum available screen space, no black borders
UseNewDefaultFonts( 1 ) // since version 2.0.22 we can use nicer default fonts

global gameover as integer = 0

#include "road.agc"
#include "player.agc"
#include "point.agc"
#include "enemy.agc"
#include "score.agc"
#include  "sound.agc"

createSound()

AddVirtualButton(1,100,100,150)
SetVirtualButtonPosition(1,220,310)
SetVirtualButtonImageUp(1,LoadImage("images/Button_Play.png"))
SetVirtualButtonImageDown(1,LoadImage("images/Button_Play.png"))

while start = 0
	if GetSoundsPlaying(sBg) = 0 then PlaySound(sBg)
	imgStart = LoadImage("images/start.jpg")
	sStart =CreateSprite(imgStart)
	if GetVirtualButtonPressed(1)
		start = 1
		SetSpriteVisible(sStart,0)
		SetVirtualButtonVisible(1,0)
		StopSound(sBg)
	endif
	sync()
endwhile

createRoad()
createGrass()
createPlayer()
createEnemy()
createPoint()
createScore()
createExplosion()

showEnemy(Random(0,1))
showPoint(Random(0,2))

fGame = LoadFont("fonts/game.ttf")
tGame =CreateText("GAME")
SetTextFont(tGame,fGame)
SetTextSize(tGame,80)
SetTextColor(tGame,255,0,0,255)
SetTextPosition(tGame,40,150)
SetTextVisible(tGame,0)

tOver =CreateText("OVER")
SetTextFont(tOver,fGame)
SetTextSize(tOver,80)
SetTextColor(tOver,255,0,0,255)
SetTextPosition(tOver,150,150+GetTextTotalHeight(tGame))
SetTextVisible(tOver,0)

AddVirtualButton(2,100,100,150)
SetVirtualButtonImageUp(2,LoadImage("images/btn_Try.png"))
SetVirtualButtonImageDown(2,LoadImage("images/btn_Try.png"))
SetVirtualButtonVisible(2,0)

AddVirtualButton(3,100,100,150)
SetVirtualButtonImageUp(3,LoadImage("images/btn_Exit.png"))
SetVirtualButtonImageDown(3,LoadImage("images/btn_Exit.png"))
SetVirtualButtonVisible(3,0)

do
	if gameover = 0
		if GetSoundsPlaying(sCar) = 0 then PlaySound(sCar)
		moveRoad()
		movePlayer()
		movePoint()
		moveEnemy()
		updatePoint()
		updateLife()
	else
		SetTextVisible(tGame,1)
		SetTextVisible(tOver,1)
		
		SetVirtualButtonVisible(2,1)
		SetVirtualButtonVisible(3,1)
		SetVirtualButtonPosition(2,160,200+GetTextTotalHeight(tGame)+GetTextTotalHeight(tOver))
		SetVirtualButtonPosition(3,320,200+GetTextTotalHeight(tGame)+GetTextTotalHeight(tOver))
		
		if GetVirtualButtonPressed(2)
			showEnemy(Random(0,1))
			showPoint(Random(0,2))
			resetPlayer()
			score = 0
			g_player.Life = 3
			SetTextString(tscore,str(score))
			SetTextString(tLife,str(g_player.Life))
			SetVirtualButtonVisible(2,0)
			SetVirtualButtonVisible(3,0)
			SetTextVisible(tGame,0)
			SetTextVisible(tOver,0)
			gameover = 0
		endif
		if GetVirtualButtonPressed(3)
			end
		endif
	
	endif
    Sync()
loop
