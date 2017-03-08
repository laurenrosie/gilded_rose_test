require './lib/update_methods'

class GildedRose

  include UpdateMethods

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      if is_regular?(item)
        update_normal(item)
      elsif is_aged?(item)
        update_aged(item)
      elsif is_passes?(item)
        update_passes(item)
      elsif is_conjured?(item)
        update_conjured(item)
      else
        update_legendary(item)
      end
    end
  end

  private

  def is_regular?(item)
    !is_aged?(item) && !is_passes?(item) && !is_legendary?(item) && !is_conjured?(item)
  end

  def is_aged?(item)
    item.name == "Aged Brie"
  end

  def is_passes?(item)
    item.name == "Backstage passes to a TAFKAL80ETC concert"
  end

  def is_legendary?(item)
    item.name == "Sulfuras, Hand of Ragnaros"
  end

  def is_conjured?(item)
    item.name == "Conjured genie"
  end

end
