class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      case item.name
      when "Aged Brie"
        update_aged_brie(item)
      when "Sulfuras, Hand of Ragnaros"
        update_sulfuras(item)
      when "Backstage passes to a TAFKAL80ETC concert"
        update_backstage_passes(item)
      when "Conjured"
        update_conjured_item(item)
      else
        update_default_item(item)
      end
    end
  end

  # Seperate methods for each update style
  def update_aged_brie(item)
    item.quality = item.quality + 1 if item.quality < 50 && item.sell_in > 0
    item.quality = item.quality + 2 if item.quality > 0 && item.sell_in == 0
    item.sell_in = item.sell_in - 1 if item.sell_in > 0
  end

  def update_sulfuras(item)
    item.quality = 80
  end

  def update_backstage_passes(item)
    item.quality = item.quality + 1 if item.sell_in > 10
    item.quality = item.quality + 2 if item.sell_in > 5 and item.sell_in <= 10
    item.quality = item.quality + 3 if item.sell_in > 0 and item.sell_in <= 5
    item.quality = 50 if item.quality > 50
    item.quality = 0 if item.sell_in == 0
  end

  def update_conjured_item(item)
    item.quality = item.quality - 2 if item.quality > 0 && item.sell_in > 0
    item.quality = item.quality - 4 if item.quality > 0 && item.sell_in == 0
    item.sell_in = item.sell_in - 1 if item.sell_in > 0
  end

  def update_default_item(item)
    item.quality = item.quality - 1 if item.quality > 0 && item.sell_in > 0
    item.quality = item.quality - 2 if item.quality > 0 && item.sell_in == 0
    item.sell_in = item.sell_in - 1 if item.sell_in > 0
  end

end
