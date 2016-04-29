require './gilded_rose.rb'
require './item.rb'
# Run the program by typing `ruby main.rb`
# Also please run tests before pushing

# Add some test item
aged_brie = Item.new("Aged Brie", 15, 50)
sulfuras = Item.new("Sulfuras", 15, 50)
backstage_passes = Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 50)
default = Item.new("default", 15, 50)

item_array = [aged_brie, sulfuras, backstage_passes, default]

puts aged_brie.to_s
puts sulfuras.to_s
puts backstage_passes.to_s
puts default.to_s

gilded_rose = GildedRose.new(item_array)

puts gilded_rose.update_quality
