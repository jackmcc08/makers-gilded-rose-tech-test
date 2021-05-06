require_relative './lib/gilded_rose'

default_items = [
  Item.new("foo", 0, 0),
  Item.new("Sake", 10, 20),
  Item.new("Normal Item", 1, 10),
  Item.new("Aged Brie", 10, 20),
  Item.new("Sulfuras, Hand of Ragnaros", 0, 50),
  Item.new("Backstage passes to a TAFKAL80ETC concert", 11, 20),
  Item.new("Backstage passes to a TAFKAL80ETC concert", 11, 50),
  Item.new("Conjured Hand of Darkness", 15, 40)
]

INN = GildedRose.new(default_items)
