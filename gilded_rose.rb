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
      subtract_sell_in(item) unless item.name == "Sulfuras, Hand of Ragnaros"
    end
  end

  # Seperate methods for each update style
  def update_aged_brie(item)
    add_quality(item, 1)
  end

  def update_sulfuras(item)
    item.quality = 80
  end

  def update_backstage_passes(item)
    # We divided by zero! MUAHAHAHAHA! say goodbye to the universe!
    inf = 1.0 / 0.0
    case item.sell_in
    when (11..inf)
      add_quality(item, 1)
    when (6..10)
      add_quality(item, 2)
    when (1..5)
      add_quality(item, 3)
    else
      item.quality = 0
    end
  end

  def update_conjured_item(item)
    subtract_quality(item, 2)
  end

  def update_default_item(item)
    subtract_quality(item, 1)
  end

  def add_quality(item, amount)
    amount *= 2 if item.sell_in <= 0
    item.quality += amount if item.quality < 50
    item.quality = 50 if item.quality > 50
  end

  def subtract_quality(item, amount)
    amount *= 2 if item.sell_in <= 0
    item.quality -= amount if item.quality > 0
    item.quality = 0 if item.quality < 0
  end

  def subtract_sell_in(item)
    item.sell_in -= 1 if item.sell_in > 0
  end
end
