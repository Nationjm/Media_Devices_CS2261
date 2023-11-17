#include <stdlib.h>
#include <stdio.h>
#include <limits.h>
#include "list.h"
#include "print.h"

static NODE* createNode(POSITION position);

// Creates a list by allocating memory for it on the heap
// Be sure to initialize head and tail to NULL and return a pointer to the list!
LIST* createList(void) {
    // TODO 1.0: Complete this function
    // Make sure to handle the case where malloc cannot allocate enough memory for the list 
    // by making an entertaining (but school appropriate) log message!
    LIST* list = malloc(sizeof(LIST));
    if (list == NULL) {
        mgba_printf("list is null");
    } else {
        list->head = NULL;
        list->tail = NULL;
    }
    return list;
    
}

// Helper function that creates a node by allocating memory for it on the heap
// Be sure to set its pointers to NULL and to set the data to the passed in position!
static NODE* createNode(POSITION position) {
    // TODO 1.1: Complete this function
    // Make sure to handle the case where malloc cannot allocate enough memory for the list 
    // by making an entertaining (but school appropriate) log message!
    NODE* node = malloc(sizeof(NODE));
    if (node == NULL) {
        mgba_printf("node is null");
    } else {
        node->position = position;
        node->next = NULL;
        node->prev = NULL;
    }
    return node;
}

// Adds the data to the front of the linked list
void pushFront(LIST *dllist, POSITION position) {
    NODE *node = createNode(position);

    if (dllist->head != NULL) { // list isn't empty
        node->next = dllist->head;
        dllist->head->prev = node;
    } else { // list is empty
        dllist->tail = node;
    }
    dllist->head = node;
}

// Adds the data to the end of the linked list
void pushBack(LIST *dllist, POSITION position) {
    // TODO 1.2: Complete this function
    // Don't forget to handle the empty list case!
    NODE* node = createNode(position);
    if (dllist->head != NULL) {
        dllist->tail->next = node;
        node->prev = dllist->tail;
    } else {
        dllist->head = node;
    }
    dllist->tail = node;
}

// Removes the node at the front of the linked list and returns its value
// Popping an empty list returns (POSITION) {.col = 0, .row = 0}
POSITION popFront(LIST *dllist) {
    if (dllist->head == NULL) {
        return (POSITION) {.x = 0, .y = 0};
    }
    POSITION toReturn = dllist->head->position;
    NODE* toFree = dllist->head;
    dllist->head = dllist->head->next;
    if (dllist->head != NULL) {
        dllist->head->prev = NULL;
    }
    if (dllist->head == NULL) {
        dllist->tail = NULL;
    } 
    free(toFree);
    return toReturn;
}

// Removes the node at the back of the linked list
POSITION popBack(LIST *dllist) {
    if (dllist->head == NULL || dllist->tail == NULL) {
        return (POSITION) {.x = 0, .y = 0};
    }
    POSITION toReturn = dllist->tail->position;
    NODE* toFree = dllist->tail;
    dllist->tail = dllist->tail->prev;
    if (dllist->tail == NULL) {
        dllist->head = NULL;
    }
    if (dllist->tail != NULL) {
        dllist->tail->next = NULL;
    }
    free(toFree);
    return toReturn;
}

// Gets the number of nodes in the linked list
int size(LIST *dllist) {
    int size = 0;
    NODE* curr = dllist->head;
    while (curr != NULL) {
        size++;
        curr = curr->next;
    }
    return size;
}

// TODO 3.0: Complete this function
void deleteList(LIST *dllist) {
    // Delete every node in the list by calling popFront repeatedly
    // Keep in mind that popFront frees each node when removing it from the list
    // so you don't need to worry about that!
    while (dllist->head != NULL) { 
        popFront(dllist);
    }

    // Free the dlllist itself
    free(dllist);
}

// Starting from the back of the list, sets each node's pos to the previous node's pos
void updateNodePositions(LIST *dllist) {
    // TODO 2.0: Complete this function
    NODE* curr = dllist->tail;
    while (curr->prev != NULL) {
        curr->position = curr->prev->position;
        curr = curr->prev;
    }

}