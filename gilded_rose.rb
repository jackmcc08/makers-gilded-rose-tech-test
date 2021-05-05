class GildedRose
  attr_reader :items

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      next if sulfuras?(item)
      end_day(item)

      if aged_brie?(item)
        # adjust_brie_quality(item)
        increase_quality(item)
        increase_quality(item) if past_sell_in?(item)
        next
      end

      if backstage?(item)
        increase_quality(item)
        if item.sell_in < 10
          increase_quality(item)
        end
        if item.sell_in < 5
          increase_quality(item)
        end
        if past_sell_in?(item)
          item.quality = 0
        end
        next
      end

      if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert" # normal item
        decrease_quality(item)
        decrease_quality(item) if past_sell_in?(item)
      end
    end
  end

  private

  def sulfuras?(item)
    item.name == "Sulfuras, Hand of Ragnaros"
  end

  def aged_brie?(item)
    item.name == "Aged Brie"
  end

  def backstage?(item)
    item.name == "Backstage passes to a TAFKAL80ETC concert"
  end

  def end_day(item)
    item.sell_in -= 1
  end

  def increase_quality(item)
    item.quality += 1 if item.quality < 50
  end

  def decrease_quality(item)
    item.quality -= 1 if item.quality > 0
  end

  def past_sell_in?(item)
    item.sell_in < 0
  end

  # def adjust_brie_quality(item)
  #   increase_quality(item)
  #   increase_quality(item) if past_sell_in?(item)
  # end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
