#ifndef LIST_H
#define LIST_H

typedef struct lab {
	const unsigned short* bitmap;
	char name[6];
	unsigned short textColor;
} LAB;

// Struct for a node for a doubly-linked list
typedef struct dlnode {
	struct dlnode* prev;
	struct dlnode* next;
	LAB lab;
} NODE;

// Struct for a doubly-linked list
typedef struct dllist {
	struct dlnode *head;
	struct dlnode *tail;
} LIST;


// ---- Prototypes ----
LIST* createList();
void pushBack(LIST *dllist, LAB lab);

#endif
