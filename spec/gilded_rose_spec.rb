require 'spec_helper'

describe GildedRose do

  describe "#update_quality" do
    context "Sulfuras" do
      it "does not decrease quality" do
      end

      it "does not change its sell_in value" do
      end

      it "does not exceed a quality of 50" do
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
      end

      it "increases quality by two if the sell_in is less than 10" do
      end

      it "increases quality by 3 if the sell_in is less than 5" do
      end

      it "drops the quality to 0 if the sell_in is zero" do
      end

      it "reduces the sell_in but not less than zero" do
      end

      it "does not exceed a quality of 50" do
      end
    end
  end

end
