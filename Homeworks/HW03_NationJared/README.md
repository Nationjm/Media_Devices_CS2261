# Galaga

## How To Play
The goal of the game is to destroy all enemies with a bullet fired by the player <br>
The player is the cyan spaceship at the bottom of the screen <br>
The enemies are the red squares at the top of the screen

## Controls
Press the left and right button to move the player <br>
Press the A button to fire a bullet <br>
Press the Select button to pause the game

## States
The game starts in the Start state <br> 
Press the Start button to enter the Game state <br>
When the game is paused using the Select button,
the game enters the Pause state <br>
When all enemies are destroyed the Win state is entered

## Important Notes
When there are only 10 enemies left on the screen the player turns yellow <br>
There is a chance that when a block is destroyed it will drop a powerup. <br>
If the player catches the powerup, the player speed doubles
