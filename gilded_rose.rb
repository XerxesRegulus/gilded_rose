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

  end

  def update_sulfuras(item)

  end

  def update_backstage_passes(item)

  end

  def update_conjured_item(item)

  end

  def update_default_item(item)

  end
end
