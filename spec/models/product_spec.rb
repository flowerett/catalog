require 'spec_helper'
require 'builder'

describe Product do
  it { should have_many :replies }

  describe '.upload' do
    let(:xml) do
      xml = ''
      builder = Builder::XmlMarkup.new(:target => xml)
      builder.instruct!

      builder.product do |product|
        product.product_id '30013810'
        product.title 'Explay Test'
      end

      xml
    end
    let(:fake_xml) { 'fake str' }

    before do 
      Product.upload(xml)
      Product.upload(fake_xml)
    end

    it 'should find only products and create product from xml' do
      expect(Product.where(id: 30013810).count).to eq 1
    end
  end
end
