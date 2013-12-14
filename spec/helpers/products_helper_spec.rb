require 'spec_helper'

describe ProductsHelper do
  describe "#price_for_product" do
    let(:product_with_regular_price)  { create :product, :with_regular_price }
    let(:product_with_discount_price) { create :product, :with_discount_price }
    let(:product_with_equal_price)    { create :product, :with_equal_price }

    it "displays regural price if no inet_price" do
      expect(helper.price_for_product(product_with_regular_price)).to match /100/
    end

    it "displays discount price if inet_price less than regular price" do
      expect(helper.price_for_product(product_with_discount_price)).to match /90/
    end

    it "displays regural price if price and inet_price are equal" do
      expect(helper.price_for_product(product_with_equal_price)).to match /120/
    end
  end
end
