# How To Play
When the game begins, the car begins driving down the road and must avoid oncoming cones. <br>
Use the Up, Down, Left, and Right buttons to help the car navigate and avoid the cones. <br>
The cones are oncoming at increasing speed over time. <br>
The game ends when the player collides with an oncoming cone. 

# State Machine Controls
When in the Start state the player has two options: view high score or begin the game. <br>
Press the Start button to begin the game, entering the Game state, <br>
or the Select button to view the high score, entering the Scoreboard state. <br>
During play, the player can pause the game and enter the Pause state by pressing the Select button. <br>
While in the Pause state, the player can press the Select button to return to gameplay in the Game state. <br>
When in the Scoreboard state, the player can press the Select button to return the the Start state. <br>
During play, if the player collides with a cone and they have not surpassed the current high score, <br>
they will enter the Game Over state. <br> 
If the player collides with a cone and they have surpassed the current high score, <br> 
they will enter the Highscore state. <br>
While in the Highscore state, the player can press Start to enter the Scoreboard state and view <br>
their new high score. <br>
In any instance that the game says press start, pressing A will also work for ease on the original hardware. <br>
Also, in any instance the game says press select, pressing B will also work for ease on the original hardware.

# Image Change and Animation
If the player reaches a score of 100 or higher, the car will turn blue, changing images entirely. <br>
The car will also increase in speed so that it has a easier time moving around the oncoming cones.
When the player reaches a new high score and is taken to the high score state, there is an animation <br>
of a firework going up and exploding that continues until they change states. <br>
This animation is done using 3 different images and two of the images share the same color palette.