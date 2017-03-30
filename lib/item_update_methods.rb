module ItemUpdateMethods

    MIN_QUALITY = 0
    MAX_QUALITY = 50
    MIN_SELL_IN = 0
    DEFAULT_QUALITY_CHANGE = 1
    DEFAULT_SELL_IN_CHANGE = 1
    NORMAL_QUALITY_INCREASE_MULTIPLE = 2
    PASSES_QUALITY_INCREASE_MULTIPLE = 3
    CONJURED_QUALITY_INCREASE_MULTIPLE = 4

    def update_normal(item)
      if above_min_sell_in(item)
        decrease_sellin(item)
        decrease_quality(item) if above_min_quality(item)
      else
        NORMAL_QUALITY_INCREASE_MULTIPLE.times{decrease_quality(item) if above_min_quality(item)}
      end
    end

    def update_aged(item)
      if above_min_sell_in(item)
        decrease_sellin(item)
        increase_quality(item) if below_max_quality(item)
      else
        NORMAL_QUALITY_INCREASE_MULTIPLE.times{increase_quality(item) if below_max_quality(item)}
      end
    end

    def update_legendary(item)
    end

    def update_passes(item)
      if item.sell_in >10
        in_date_item_update(item)
      elsif item.sell_in > 5
        decrease_sellin(item)
        NORMAL_QUALITY_INCREASE_MULTIPLE.times{increase_quality(item) if below_max_quality(item)}
      elsif item.sell_in > MIN_SELL_IN
        decrease_sellin(item)
        PASSES_QUALITY_INCREASE_MULTIPLE.times{increase_quality(item) if below_max_quality(item)}
      else
        item.quality = 0
      end
    end

    def update_conjured(item)
      if above_min_sell_in(item)
        decrease_sellin(item)
        NORMAL_QUALITY_INCREASE_MULTIPLE.times{decrease_quality(item) if item.quality > MIN_QUALITY}
      else
        CONJURED_QUALITY_INCREASE_MULTIPLE.times{decrease_quality(item) if item.quality > MIN_QUALITY}
      end
    end

    def in_date_item_update(item)
      decrease_sellin(item)
      increase_quality(item) if below_max_quality(item)
    end

    def increase_quality(item)
      item.quality = item.quality + DEFAULT_QUALITY_CHANGE
    end

    def decrease_quality(item)
      item.quality = item.quality - DEFAULT_QUALITY_CHANGE
    end

    def decrease_sellin(item)
      item.sell_in = item.sell_in - DEFAULT_SELL_IN_CHANGE
    end

    def below_max_quality(item)
      item.quality < MAX_QUALITY
    end

    def above_min_quality(item)
      item.quality > MIN_QUALITY
    end

    def above_min_sell_in(item)
      item.sell_in > MIN_SELL_IN
    end

end
