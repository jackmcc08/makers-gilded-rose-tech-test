require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do
  TEST_ITEMS = [
    Item.new("foo", 0, 0),
    Item.new("Sake", 10, 20),
    Item.new("Aged Brie", 10, 20),
    Item.new("Sulfuras, Hand of Ragnaros", 0, 50),
    Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20)
  ]
  let(:test_rose) { GildedRose.new(TEST_ITEMS) }

  describe "#update_quality" do
    it "does not change the name of the item" do
      expect(test_rose.update_quality()[0].name).to eq "foo"
    end
  end

end

# Item.new(name, sell_in, quality)
