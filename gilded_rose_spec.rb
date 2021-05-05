require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do


  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "fixme"
    end
  end

end

# Item.new(name, sell_in, quality)

TEST_ITEMS = [
  Item.new("foo", 0, 0),
  Item.new("Sake", 10, 20),
  Item.new("Aged Brie", 10, 20),
  Item.new("Sulfuras, Hand of Ragnaros", 0, 80),
  Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20)
]
