class GildedRose

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

  def update_normal(item)
    if item.sell_in > 0
      decrease_sellin(item)
      decrease_quality(item) if item.quality > 0
    else
      2.times{decrease_quality(item) if item.quality > 0}
    end
  end

  def update_aged(item)
    if item.sell_in > 0
      decrease_sellin(item)
      increase_quality(item) if below_max_quality(item)
    else
      2.times{increase_quality(item) if below_max_quality(item)}
    end
  end

  def update_passes(item)
    if item.sell_in >10
      decrease_sellin(item)
      increase_quality(item) if below_max_quality(item)
    elsif item.sell_in > 5
      decrease_sellin(item)
      2.times{increase_quality(item) if below_max_quality(item)}
    elsif item.sell_in > 0
      decrease_sellin(item)
      3.times{increase_quality(item) if below_max_quality(item)}
    else
      item.quality = 0
    end
  end

  def update_legendary(item)
  end

  def update_conjured(item)
    if item.sell_in > 0
      decrease_sellin(item)
      2.times{decrease_quality(item) if item.quality > 0}
    else
      4.times{decrease_quality(item) if item.quality > 0}
    end
  end

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

  def increase_quality(item)
    item.quality = item.quality + 1
  end

  def decrease_quality(item)
    item.quality = item.quality - 1
  end

  def decrease_sellin(item)
    item.sell_in = item.sell_in - 1
  end

  def below_max_quality(item)
    item.quality < 50
  end

end
