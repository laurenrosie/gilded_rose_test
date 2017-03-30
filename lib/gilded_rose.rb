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
      update_item(item)
    end
  end

  def update_item(item)
    update_normal(item) if is_regular?(item)
    update_aged(item) if is_aged?(item)
    update_passes(item) if is_passes?(item)
    update_conjured(item) if is_conjured?(item)
    update_legendary(item) if is_legendary?(item)
  end
end
