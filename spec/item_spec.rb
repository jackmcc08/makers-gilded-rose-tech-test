require 'item'

describe Item do
  let(:test_item) { Item.new("test", 5, 10) }

  describe '#new' do
    it 'creates a new item with a name, sell_in and quality value' do
      expect(test_item.name).to eq "test"
      expect(test_item.sell_in).to eq 5
      expect(test_item.quality).to eq 10
    end
  end

  describe '#to_s' do
    it 'produces a string of the items values' do
      expect(test_item.to_s).to eq "test, 5, 10"
    end
  end
end
