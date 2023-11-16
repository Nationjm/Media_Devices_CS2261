#include <stdio.h>
#include <stdlib.h>

#define SUCCESS 0
#define MALLOC_FAIL 1
#define CONSTRAINT_FAILED 2
#define NULL_TREE 3

typedef struct tNode {
  int data;
  struct tNode* left;
  struct tNode* right;
} TreeNode;


typedef struct {
  TreeNode* root;
} BST;

/* !!!!! For learning purposes only -- DO NOT COPY+PASTE FROM THIS FILE !!!!! */
BST* newBST(){
  // malloc space
  BST *tree = malloc(sizeof(BST));
  // handle NULL
  if (NULL == tree) {
    return NULL;
  } 
  // initialize
  tree->root = NULL;
  //return
  return tree;
}

TreeNode* newNode(int data){
  // malloc space
  TreeNode *node = malloc(sizeof(TreeNode));
  // handle NULL
  if (NULL == node) {
    return NULL;
  }
  // initialize
  node->data = data;
  node->left = NULL;
  node->right = NULL;
  // return
  return node;
}

int addNode(TreeNode* current, TreeNode* new){
  // do this recursively left if current > new, right if <, == is an error
  if (current->data > new->data){  // insert left
    if (current->left == NULL) {
      current->left = new;
    } else {
      addNode(current->left, new);
    }
    // each left/right can be base case (NULL) or a node.
  } else if (current->data < new->data) {  // insert right
    if (current->right == NULL) {
      current->right = new;
    } else {
      addNode(current->right, new);
    }
    // each left/right can be base case (NULL) or a node.
  } else { printf("\n***ERR: REFUSED TO ADD NON-UNIQUE VALUE***\n"); return CONSTRAINT_FAILED; }
  return SUCCESS;
}

/* !!!!! For learning purposes only -- DO NOT COPY+PASTE FROM THIS FILE !!!!! */
int addNodeToTree(BST* tree, int data){
  // new Node for data
  TreeNode *node = newNode(data);
  // check for null
  if (NULL == node) {
    printf("I could not add a new node! Aborting.");
    return MALLOC_FAIL;
  }
  // empty root => new root
  if (NULL == tree->root) {
    tree->root = node;
    return SUCCESS;
  }
  // else addNode
  return addNode(tree->root, node);
}

void printNode(TreeNode* node, int depth){
  for (int i=0;i<depth;i++){
    printf("\t");
  }
  printf("[%d]\n", node->data);
  if (node->left) {
    for (int i=0;i<depth;i++){
      printf("\t");
    }
    printf("Left:");
    printNode(node->left, depth + 1);
  }
  if (node->right) {
    for (int i=0;i<depth;i++){
      printf("\t");
    }
    printf("Right:");
    printNode(node->right, depth + 1);
  }
}

/* !!!!! For learning purposes only -- DO NOT COPY+PASTE FROM THIS FILE !!!!! */
void printTree(BST* tree){
  printf("Root node:\n");
  if (tree->root == NULL) { printf("NULL"); }
  else printNode(tree->root, 1);
}

void freeNode(TreeNode* node){
  // recursion again!
  // NULL is no-op
  if (NULL == node) { return; }
  // free left
  freeNode(node->left);
  // free right
  freeNode(node->right);
  printf("\n Freeing node: %d.", node->data);
  // free myself
  free(node);
}

void freeTree(BST* tree){
  if (tree == NULL) {
    return;
  }
  freeNode(tree->root);
  printf("\n Freeing the tree.");
  free(tree);
}

/* !!!!! For learning purposes only -- DO NOT COPY+PASTE FROM THIS FILE !!!!! */
int main(){
  BST* tree = newBST();
  
  printf("Empty Tree:\n");
  printTree(tree);

  printf("\n\nAdd 22 to the tree:\n");
  addNodeToTree(tree, 22);
  printTree(tree);

  printf("\n\nAdd 2 to the tree (again):\n");
  addNodeToTree(tree, 2);
  printTree(tree);

  printf("\n\nAdd 37 to tree:\n");
  addNodeToTree(tree, 37);
  printTree(tree);

  printf("\n\nAdd 1 to tree:\n");
  addNodeToTree(tree, 1);
  printTree(tree);

  printf("\n\nAdd 14 to tree:\n");
  addNodeToTree(tree, 14);
  printTree(tree);

  printf("\n\nAdd 54 to tree:\n");
  addNodeToTree(tree, 54);
  printTree(tree);

  printf("\n\nAdd 18 to tree:\n");
  addNodeToTree(tree, 18);
  printTree(tree);

  printf("\nFreeing the tree!:\n");
  freeTree(tree);

  printf("\nAfter freeing....:");
  printTree(tree);
}
/* !!!!! For learning purposes only -- DO NOT COPY+PASTE FROM THIS FILE !!!!! */