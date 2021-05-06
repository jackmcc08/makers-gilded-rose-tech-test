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

puts "
Program autoloaded with a new inn - 'INN'.

Inn is loaded 8 default items to show off the various changes as each day ends.

You can create your own inn with `inn_name = GildedRose.new(items_array)`.

You will need to create the inn with an array of items, build up an array with instances of the Item Class - `Item.new(name (string), sell_in (integer), quality (integer))`

An example of an item array:

` items_array = [
  Item.new('foo', 0, 0),
  Item.new('Sake', 10, 20),
  Item.new('Normal Item', 1, 10),
  Item.new('Aged Brie', 10, 20),
  Item.new('Sulfuras, Hand of Ragnaros', 0, 50),
  Item.new('Backstage passes to a TAFKAL80ETC concert', 11, 20),
  Item.new('Backstage passes to a TAFKAL80ETC concert', 11, 50),
  Item.new('Conjured Hand of Darkness', 15, 40)
]
`

Methods you can use with `INN` :

- `INN.items` - displays all items and their stats
- `INN.update_quality - ends the day and changes each items quality and sell_in value.`

"
