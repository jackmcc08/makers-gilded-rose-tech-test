require_relative 'item'

class GildedRose
  attr_reader :items

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each { |item|
      end_day(item)

      next adjust_uncommon_item_quality(item) if uncommon_item?(item)

      adjust_normal_item_quality(item)
    }
  end

  private

  def end_day(item)
    item.sell_in -= 1 unless sulfuras?(item)
  end

  def increase_one_quality(item)
    item.quality += 1 if item.quality < 50
  end

  def decrease_one_quality(item)
    item.quality -= 1 if item.quality.positive?
  end

  def zero_quality(item)
    item.quality = 0
  end

  def past_sell_in?(item)
    item.sell_in.negative?
  end

  def uncommon_item?(item)
    return true if sulfuras?(item)
    return true if aged_brie?(item)
    return true if backstage?(item)
    return true if conjured?(item)

    false
  end

  def adjust_uncommon_item_quality(item)
    adjust_brie_quality(item) if aged_brie?(item)
    adjust_backstage_quality(item) if backstage?(item)
    adjust_conjured_quality(item) if conjured?(item)
  end

  def sulfuras?(item)
    item.name == "Sulfuras, Hand of Ragnaros"
  end

  def aged_brie?(item)
    item.name == "Aged Brie"
  end

  def adjust_brie_quality(item)
    increase_one_quality(item)
    increase_one_quality(item) if past_sell_in?(item)
  end

  def backstage?(item)
    item.name == "Backstage passes to a TAFKAL80ETC concert"
  end

  def adjust_backstage_quality(item)
    increase_one_quality(item)
    increase_one_quality(item) if item.sell_in < 10
    increase_one_quality(item) if item.sell_in < 5
    zero_quality(item) if past_sell_in?(item)
  end

  def conjured?(item)
    item.name == "Conjured Hand of Darkness"
  end

  def adjust_conjured_quality(item)
    2.times {
      decrease_one_quality(item)
      decrease_one_quality(item) if past_sell_in?(item)
    }
  end

  def adjust_normal_item_quality(item)
    decrease_one_quality(item)
    decrease_one_quality(item) if past_sell_in?(item)
  end
end
