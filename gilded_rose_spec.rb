require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do
  class ItemDouble
    attr_accessor :name, :sell_in, :quality

    def initialize(name, sell_in, quality)
      @name = name
      @sell_in = sell_in
      @quality = quality
    end
  end

  before do
    test_items = [
      ItemDouble.new("foo", 0, 0),
      ItemDouble.new("Sake", 10, 20),
      ItemDouble.new("Normal Item", 1, 10),
      ItemDouble.new("Aged Brie", 10, 20),
      ItemDouble.new("Sulfuras, Hand of Ragnaros", 0, 50),
      ItemDouble.new("Backstage passes to a TAFKAL80ETC concert", 11, 20),
      ItemDouble.new("Backstage passes to a TAFKAL80ETC concert", 11, 50)
    ]
    @test_rose = GildedRose.new(test_items)
  end


  describe "#update_quality" do
    it "does not change the name of the item" do
      expect(@test_rose.update_quality[0].name).to eq "foo"
    end

    context "for a normal item" do
      it "at end of each day, quality decreases by 1 if sell_in value is >= 0" do
        expect { @test_rose.update_quality() }.to change { @test_rose.items[2].quality }.by(-1)
        expect(@test_rose.items[2].quality).to eq 9
      end

      it "at end of each day, quality decreases by 2 if sell_in value is < 0" do
        @test_rose.update_quality()
        expect { @test_rose.update_quality() }.to change { @test_rose.items[2].quality }.by(-2)
        expect(@test_rose.items[2].quality).to eq 7
      end

      it "quality never decreases below zero" do
        6.times { @test_rose.update_quality() }
        expect { @test_rose.update_quality() }.to change { @test_rose.items[2].quality }.by(0)
        expect(@test_rose.items[2].quality).to eq 0
      end

      it "at end of each day, sell_in decreases by 1" do
        expect { @test_rose.update_quality() }.to change { @test_rose.items[2].sell_in }.by(-1)
        expect(@test_rose.items[2].sell_in).to eq 0
      end
    end

    context "for Aged Brie" do
      it "at end of each day, quality increases by 1" do
        expect { @test_rose.update_quality }.to change { @test_rose.items[3].quality }.by(1)
        expect(@test_rose.items[3].quality).to eq 21
      end

      it "at end of each day, quality increase by 2 if sell_in is less than 0" do
        10.times { @test_rose.update_quality }
        expect(@test_rose.items[3].quality).to eq 30
        expect { @test_rose.update_quality }.to change { @test_rose.items[3].quality }.by(2)
        expect(@test_rose.items[3].quality).to eq 32

      end

      it 'quality never increases above 50' do
        20.times { @test_rose.update_quality() }
        expect(@test_rose.items[3].quality).to eq 50
        expect { @test_rose.update_quality() }.to change { @test_rose.items[3].quality }.by(0)
        expect(@test_rose.items[3].quality).to eq 50
      end
    end

    context 'for Sulfuras' do
      it "at end of each day, quality does not change" do
        expect(@test_rose.items[4].quality).to eq 50
        expect { @test_rose.update_quality() }.not_to change { @test_rose.items[4].quality }
        expect(@test_rose.items[4].quality).to eq 50
      end

      it "at end of each day, sell_in valude does not change" do
        expect(@test_rose.items[4].sell_in).to eq 0
        expect { @test_rose.update_quality() }.not_to change { @test_rose.items[4].sell_in }
        expect(@test_rose.items[4].sell_in).to eq 0
      end
    end

    context 'for Backstage Passes' do
      it 'at end of each day, quality increased by 1 when sell_in value is above 10' do
        expect(@test_rose.items[5].quality).to eq 20
        expect { @test_rose.update_quality() }.to change { @test_rose.items[5].quality }.by(1)
        expect(@test_rose.items[5].quality).to eq 21
      end

      it 'at end of each day, quality increased by 2 when sell_in value is between 10 and 6 inclusive' do
        expect(@test_rose.items[5].quality).to eq 20
        @test_rose.update_quality()
        expect(@test_rose.items[5].quality).to eq 21

        expect { @test_rose.update_quality() }.to change { @test_rose.items[5].quality }.by(2)
        expect(@test_rose.items[5].quality).to eq 23

        4.times { @test_rose.update_quality() }
        expect(@test_rose.items[5].quality).to eq 31
      end

      it 'at end of each day, quality increased by 3 when sell_in value is between 5 and 0 inclusive' do
        expect(@test_rose.items[5].quality).to eq 20
        6.times { @test_rose.update_quality() }
        expect(@test_rose.items[5].quality).to eq 31

        expect { @test_rose.update_quality() }.to change { @test_rose.items[5].quality }.by(3)
        expect(@test_rose.items[5].quality).to eq 34

        4.times { @test_rose.update_quality() }
        expect(@test_rose.items[5].quality).to eq 46

      end

      it 'at end of each day, quality drops to 0 when sell_in value is below 0' do
        expect(@test_rose.items[5].quality).to eq 20

        12.times { @test_rose.update_quality() }
        expect(@test_rose.items[5].quality).to eq 0
      end

      it 'quality never increases above 50' do
        expect { @test_rose.update_quality() }.to change { @test_rose.items[6].quality }.by(0)
        expect(@test_rose.items[6].quality).to eq 50

        5.times { @test_rose.update_quality() }
        expect(@test_rose.items[6].quality).to eq 50
      end
    end
  end
end

# Item.new(name, sell_in, quality)
