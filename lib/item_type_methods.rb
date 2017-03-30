module ItemTypeMethods

  def is_regular?(item)
    !is_aged?(item) && !is_passes?(item) && !is_legendary?(item) && !is_conjured?(item)
  end

  def is_aged?(item)
    is_included_in(" ", item, "aged")
  end

  def is_passes?(item)
    is_included_in(" ", item, "passes")
  end

  def is_legendary?(item)
    comma_legendary = is_included_in(", ", item, "sulfuras")
    space_legendary = is_included_in(" ", item, "sulfuras")
    comma_legendary || space_legendary
  end

  def is_conjured?(item)
    is_included_in(" ", item, "conjured")
  end

  def is_included_in(split, item, string)
    item.name.split(split).include?(string) || item.name.split(split).include?(string.capitalize)
  end

end
