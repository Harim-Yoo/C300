#pragma once

typedef struct Inventory {
  int stock;
  int sold;
} inventory_t;

void sell_items(inventory_t *inventory, int requested);