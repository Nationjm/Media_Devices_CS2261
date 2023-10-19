#include "gba.h"
#include "print.h"
#include "sprites.h"
#include "mode0.h"

// Include background .h files
#include "block.h"
#include "world.h"

void initialize();
void update();
void draw();

u16 oldButtons;
u16 buttons;

int main() {

    initialize();

    while (1) {

        oldButtons = buttons;
        buttons = REG_BUTTONS;

        update();
        waitForVBlank();
        draw();
    
    } // while

    return 0;

} // main

void initialize() {

    mgba_open();

    // Set up background registers
    REG_DISPCTL = MODE(0) | BG_ENABLE(0);
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(8);

    // Import background palette and tiles
    DMANow(3, blockPal, BG_PALETTE, blockPalLen / 2);
    DMANow(3, blockTiles, &CHARBLOCK[0], blockTilesLen / 2);

    // Import tile map
    // DMANow(3, blockMap, &SCREENBLOCK[8], blockMapLen / 2);
    DMANow(3, worldMap, &SCREENBLOCK[8], worldMapLen / 2);

} // initialize

enum { TRANSPARENT = 0, DIRT = 1, GRASS = 2, WOOD = 3, STONE = 4, ORE = 5, BEDROCK = 6 }; // Tile IDs for each block
enum { DIAMOND = 0, GOLD = 1, REDSTONE = 2, IRON = 3, COAL = 4 }; // Palette Rows for Ores
#define NUM_PALETTE_ROWS 5

void update() {

    if (BUTTON_PRESSED(BUTTON_START)) {
        // We'll do some tilemap modification in here!
        SCREENBLOCK[8].tilemap[OFFSET(4, 11, 32)] = TILEMAP_ENTRY_TILEID(ORE) | TILEMAP_ENTRY_PALROW(IRON);
    } // if

} // update

void draw() {
    // Tilemaps automatically update their contents during VBlank, so there's no
    // need to use a draw function just yet!

} // draw