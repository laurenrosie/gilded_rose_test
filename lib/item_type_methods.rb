module ItemTypeMethods

  def is_regular?(item)
    !is_aged?(item) && !is_passes?(item) && !is_legendary?(item) && !is_conjured?(item)
  end

  def is_aged?(item)
    item.name.split(" ").include?("Aged") ||     item.name.split(" ").include?("aged")
  end

  def is_passes?(item)
    item.name.split(" ").include?("passes") || item.name.split(" ").include?("Passes")
  end

  def is_legendary?(item)
    comma_legendary = item.name.split(", ").include?("Sulfuras") || item.name.split(", ").include?("sulfuras")
    space_legendary = item.name.split(" ").include?("Sulfuras") || item.name.split(" ").include?("sulfuras")
    comma_legendary || space_legendary
  end

  def is_conjured?(item)
    item.name.split(" ").include?("Conjured") ||   item.name.split(" ").include?("conjured")
  end

end
