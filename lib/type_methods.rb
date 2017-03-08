module TypeMethods

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
