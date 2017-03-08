module TypeMethods

  def is_regular?(item)
    !is_aged?(item) && !is_passes?(item) && !is_legendary?(item) && !is_conjured?(item)
  end

  def is_aged?(item)
    item.name.split(" ").include?("Aged")
  end

  def is_passes?(item)
    item.name == "Backstage passes to a TAFKAL80ETC concert"
  end

  def is_legendary?(item)
    comma_legendary = item.name.split(", ").include?("Sulfuras")
    space_legendary = item.name.split(" ").include?("Sulfuras")
    comma_legendary || space_legendary
  end

  def is_conjured?(item)
    item.name.split(" ").include?("Conjured")
  end

end
