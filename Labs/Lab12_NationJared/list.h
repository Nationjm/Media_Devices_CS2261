#ifndef LIST_H
#define LIST_H

typedef struct position {
	int x;
	int y;
} POSITION;

// Struct for a node for a doubly-linked list
typedef struct dlnode {
	struct dlnode* prev;
	struct dlnode* next;
	POSITION position;
} NODE;

// Struct for a doubly-linked list
typedef struct dllist {
	struct dlnode *head;
	struct dlnode *tail;
} LIST;


// ---- Prototypes ----
LIST* createList();
void pushFront(LIST *dllist, POSITION pos);
void pushBack(LIST *dllist, POSITION pos);
POSITION popFront(LIST *dllist);
POSITION popBack(LIST *dllist);
int size(LIST *dllist);
void updateNodePositions(LIST *dllist);
void deleteList(LIST *dllist);

#endif
