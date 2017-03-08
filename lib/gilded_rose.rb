require './lib/item_update_methods'
require './lib/item_type_methods'

class GildedRose

  include ItemUpdateMethods
  include ItemTypeMethods

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

end
