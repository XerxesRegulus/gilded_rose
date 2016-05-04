require 'spec_helper'

describe GildedRose do

  describe "#update_quality" do
    context "Sulfuras" do
      it "does not decrease quality" do
        sulfuras = Item.new("Sulfuras, Hand of Ragnaros", 100, 80)
        gilded_rose = GildedRose.new([sulfuras])
        gilded_rose.update_quality()
        expect(sulfuras.quality).to eq(80)
      end

      it "does not change its sell_in value" do
        sulfuras = Item.new("Sulfuras, Hand of Ragnaros", 100, 80)
        gilded_rose = GildedRose.new([sulfuras])
        expect{gilded_rose}.to_not change{sulfuras.sell_in}
      end

    end

    context "Aged Brie" do
      it "increases its quality" do
      end

      it "reduces the sell_in value" do
      end

      it "reduces the sell_in but not less than zero" do
      end

      it "does not exceed a quality of 50" do
      end
    end

    context "Backstage Passes" do
      it "increases quality by one if sell_in is greater than 10" do
        backstage_passes = Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 10)
        gilded_rose = GildedRose.new([backstage_passes])
        expect{gilded_rose.update_quality}.to change{backstage_passes.quality}.from(10).to(11)
      end

      it "increases quality by two if the sell_in is less than 10" do
        backstage_passes = Item.new("Backstage passes to a TAFKAL80ETC concert", 7, 10)
        gilded_rose = GildedRose.new([backstage_passes])
        expect{gilded_rose.update_quality}.to change{backstage_passes.quality}.from(10).to(12)
      end

      it "increases quality by 3 if the sell_in is less than 5" do
        backstage_passes = Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 10)
        gilded_rose = GildedRose.new([backstage_passes])
        expect{gilded_rose.update_quality}.to change{backstage_passes.quality}.from(10).to(13)
      end

      it "drops the quality to 0 if the sell_in is zero" do
        backstage_passes = Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 10)
        gilded_rose = GildedRose.new([backstage_passes])
        gilded_rose.update_quality
        expect(backstage_passes.quality).to eq(0)
      end

      it "reduces the quality but not less than zero" do
        backstage_passes = Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 0)
        gilded_rose = GildedRose.new([backstage_passes])
        gilded_rose.update_quality()
        expect(backstage_passes.quality).to eq(0)
      end

      it "does not exceed a quality of 50" do
        backstage_passes = Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 50)
        gilded_rose = GildedRose.new([backstage_passes])
        gilded_rose.update_quality()
        expect(backstage_passes.quality).to eq(50)
      end
    end
  end

end
