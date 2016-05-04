require 'spec_helper'

describe GildedRose do

  describe "#update_quality" do
    context "Sulfuras" do
      let(:sulfuras) { Item.new("Sulfuras, Hand of Ragnaros", 100, 80) }
      let(:gilded_rose) { GildedRose.new([sulfuras]) }

      before do
        gilded_rose.update_quality()
      end

      it "does not decrease quality" do
        expect(sulfuras.quality).to eq(80)
      end

      it "does not change its sell_in value" do
        expect(sulfuras.sell_in).to eq(sulfuras.sell_in)
      end
    end

    context "Aged Brie" do
      let(:aged_brie) { Item.new("Aged Brie", 10, 20) }
      let(:old_aged_brie) { Item.new("Aged Brie", 0, 20) }
      let(:quality_aged_brie) { Item.new("Aged Brie", 0, 50) }
      let(:gilded_rose) { GildedRose.new([aged_brie, old_aged_brie]) }

      before do
        gilded_rose.update_quality()
      end

      it "increases its quality" do
        expect(aged_brie.quality).to eq(21)
      end

      it "increases in quality twice if sell in has passed" do
        expect(old_aged_brie.quality).to eq(22)
      end

      it "reduces the sell_in value" do
        expect(aged_brie.sell_in).to eq(9)
      end

      it "reduces the sell_in but not less than zero" do
        expect(old_aged_brie.sell_in).to eq(0)
      end

      it "does not exceed a quality of 50" do
        expect(quality_aged_brie.quality).to eq(50)
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

    context "Conjured Items" do
      let(:conjured) { Item.new("Conjured", 10, 20) }
      let(:old_conjured) { Item.new("Conjured", 0, 20) }
      let(:quality_conjured) { Item.new("Conjured", 10, 50) }
      let(:low_quality_conjured) { Item.new("Conjured", 10, 0) }
      let(:gilded_rose) { GildedRose.new([conjured, old_conjured, quality_conjured, low_quality_conjured]) }

      before do
        gilded_rose.update_quality()
      end

      it "degrades in quality as fast as normal items" do
        expect(conjured.quality).to eq(18)
      end

      it "reduces the sell_in value" do
        expect(conjured.sell_in).to eq(9)
      end

      it "reduces the sell_in but not less than zero" do
        expect(old_conjured.sell_in).to eq(0)
      end

      it "should degrade twice as fast if sell_in has passed" do
        expect(old_conjured.quality).to eq(16)
      end
    end

    context "Default Items" do
      let(:default_item) { Item.new("sample", 10, 20) }
      let(:old_default_item) { Item.new("sample", 0, 20) }
      let(:quality_default_item) { Item.new("sample", 10, 50) }
      let(:low_quality_default_item) { Item.new("sample", 10, 0) }
      let(:gilded_rose) { GildedRose.new([default_item, old_default_item, quality_default_item, low_quality_default_item]) }

      before do
        gilded_rose.update_quality()
      end

      it "degrades in quality" do
        expect(default_item.quality).to eq(19)
      end

      it "reduces in sell_in value" do
        expect(default_item.sell_in).to eq(9)
      end

      it "does not have quality less than 0" do
        expect(low_quality_default_item.quality).to eq(0)
      end

      it "reduces the sell_in but not less than zero" do
        expect(old_default_item.sell_in).to eq(0)
      end

      it "should degrade twice as fast if sell_in has passed" do
        expect(old_default_item.quality).to eq(18)
      end

    end
  end

end
