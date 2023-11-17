#include <stdlib.h>
#include <stdio.h>
#include "gba.h"
#include "list.h"
#include "bitmaps.h"

void initialize();

unsigned short buttons;
unsigned short oldButtons;

LIST* labsList;
NODE* currentNode;

int main() {
    initialize();

    while (1) {
        oldButtons = buttons;
		buttons = REG_BUTTONS;

        if (BUTTON_PRESSED(BUTTON_LEFT)) {
            if (currentNode->prev != NULL) {
                // Activity 2.1: Move the currentNode pointer to the previous node
                currentNode = currentNode->prev;
            }
            drawCurrentLab();
        }
        if (BUTTON_PRESSED(BUTTON_RIGHT)) {
            if (currentNode->next != NULL) {
                // Activity 2.1: Move the currentNode pointer to the next node
                currentNode = currentNode->next;
            }
            drawCurrentLab();
        }
    }
}

void drawCurrentLab() {
    waitForVBlank();
    DMANow(3, currentNode->lab.bitmap, videoBuffer, 240 * 160);
    drawString3((SCREENWIDTH - (6 * 6)) / 2, 10, currentNode->lab.name, currentNode->lab.textColor);
}

void initialize() {
    REG_DISPCTL = MODE(3) | BG_ENABLE(2);

    labsList = createList();
    pushBack(labsList, (LAB) {.bitmap = lab00Bitmap, .name = "Lab00", .textColor = WHITE});
    pushBack(labsList, (LAB) {.bitmap = Lab01Bitmap, .name = "Lab01", .textColor = MAGENTA});
    pushBack(labsList, (LAB) {.bitmap = lab02Bitmap, .name = "Lab02", .textColor = BLUE});
    pushBack(labsList, (LAB) {.bitmap = lab03Bitmap, .name = "Lab03", .textColor = RED});
    pushBack(labsList, (LAB) {.bitmap = lab04Bitmap, .name = "Lab04", .textColor = GREEN});
    pushBack(labsList, (LAB) {.bitmap = lab05Bitmap, .name = "Lab05", .textColor = CYAN});
    pushBack(labsList, (LAB) {.bitmap = lab06Bitmap, .name = "Lab06", .textColor = WHITE});
    pushBack(labsList, (LAB) {.bitmap = lab07Bitmap, .name = "Lab07", .textColor = WHITE});
    pushBack(labsList, (LAB) {.bitmap = lab08Bitmap, .name = "Lab08", .textColor = YELLOW});
    pushBack(labsList, (LAB) {.bitmap = lab09Bitmap, .name = "Lab09", .textColor = YELLOW});
    pushBack(labsList, (LAB) {.bitmap = lab10Bitmap, .name = "Lab10", .textColor = RED});
    pushBack(labsList, (LAB) {.bitmap = lab11Bitmap, .name = "Lab11", .textColor = WHITE});

    // Activity 2.0: Start the currentNode pointer at the head
    
    currentNode = labsList->head;
    drawCurrentLab();
}