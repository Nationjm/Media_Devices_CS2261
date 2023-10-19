1. look at the new spritesheet in usenti
2. for each updating sprite, set isAnimating to 0
3. in each directional check, update isAnimating and direction
4. if the player is moving, decrement framesPassed
5. if framesPassed is 0, set it back to initial value and increment curAniFrame (use mod to make the frames loop!)
6. if the player is not moving, set currAniFrame to 0
7. update the shadowOAM entry to use currAniFrame and direction