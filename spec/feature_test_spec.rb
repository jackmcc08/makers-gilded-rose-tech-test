require 'gilded_rose'

describe "Feature test - inn is created with multiple items of all different types, and at end of day, everything changes as expected." do

  test_items = [
    normal_item = Item.new("Normal Item", 1, 10),
    normal_item_past_sell_by = Item.new("Normal Item", 0, 10),
    aged_brie = Item.new("Aged Brie", 10, 20),
    aged_brie_past_sell_by = Item.new("Aged Brie", 0, 20),
    sulfuras = Item.new("Sulfuras, Hand of Ragnaros", 0, 50),
    backstage = Item.new("Backstage passes to a TAFKAL80ETC concert", 20, 20),
    backstage_within_10_sell_by = Item.new("Backstage passes to a TAFKAL80ETC concert", 8, 20),
    backstage_within_5_sell_by = Item.new("Backstage passes to a TAFKAL80ETC concert", 4, 20),
    backstage_past_sell_by = Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 40),
    conjured = Item.new("Conjured Hand of Darkness", 15, 40),
    conjured_past_sell_by = Item.new("Conjured Hand of Darkness", 0, 40)
  ]

  let(:test_inn) { GildedRose.new(test_items) }

  describe '#update_quality - changes all of the items quality as follow' do
    it {
      expect { test_inn.update_quality }
      .to change { normal_item.quality }.by(-1)
      .and change { normal_item_past_sell_by.quality }.by(-2)
      .and change { aged_brie.quality }.by(1)
      .and change { aged_brie_past_sell_by.quality }.by(2)
      .and change { backstage.quality }.by(1)
      .and change { backstage_within_10_sell_by.quality }.by(2)
      .and change { backstage_within_5_sell_by.quality }.by(3)
      .and change { backstage_past_sell_by.quality }.by(-40)
      .and change { conjured.quality }.by(-2)
      .and change { conjured_past_sell_by.quality }.by(-4)
    }

    it { expect { test_inn.update_quality }.not_to change(sulfuras, :quality) }
  end

end
