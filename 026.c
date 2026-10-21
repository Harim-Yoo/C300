#include <stdio.h>
#include "026.h"

void sell_items(inventory_t *inventory, int requested) {
  if (requested > inventory->stock) {
    inventory->sold += inventory->stock;
    inventory->stock = 0;
    return;
  }
  inventory->stock -= requested;
  inventory->sold += requested;
  return;
}

void main(void) {
  inventory_t inventory = {3, 5};
  sell_items(&inventory, 2);
  
  if (inventory.stock == 1 && inventory.sold == 7) {
    printf("Success\n");
    return;
  }
}