class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|

      #case 1: not brie or passes
      #case 2: is brie or passes

      #is not Sulfuras

      #sell_in < 0

      if !is_brie?(item) and !is_passes?(item)
        if item.quality > 0
          if !is_sulfras?(item)
            decrease_quality(item)
          end
        end
      else
        if below_max_quality(item)
          increase_quality(item)
          if is_passes?(item)
            if item.sell_in < 11
              if below_max_quality(item)
                increase_quality(item)
              end
            end
            if item.sell_in < 6
              if below_max_quality(item)
                increase_quality(item)
              end
            end
          end
        end
      end
      if !is_sulfras?(item)
        item.sell_in = item.sell_in - 1
      end
      if item.sell_in < 0
        if !is_brie?(item)
          if !is_passes?(item)
            if item.quality > 0
              if !is_sulfras?(item)
                decrease_quality(item)
              end
            end
          else
            item.quality = item.quality - item.quality
          end
        else
          if below_max_quality(item)
            increase_quality(item)
          end
        end
      end
    end
  end

  private

  def is_brie?(item)
    item.name == "Aged Brie"
  end

  def is_passes?(item)
    item.name == "Backstage passes to a TAFKAL80ETC concert"
  end

  def is_sulfras?(item)
    item.name == "Sulfuras, Hand of Ragnaros"
  end

  def increase_quality(item)
    item.quality = item.quality + 1
  end

  def decrease_quality(item)
    item.quality = item.quality - 1
  end

  def below_max_quality(item)
    item.quality < 50
  end
end
