class Product < ActiveRecord::Base
  require 'nokogiri'

  XML_KEYS = %w(product_id title description rating price inet_price image)

  has_many :replies, dependent: :destroy

  accepts_nested_attributes_for :replies

  def self.upload(file)
    xml = Nokogiri::XML(file)

    xml.search('product').each do |product|
      obj_params = {}
      XML_KEYS.each{ |key| obj_params[key.to_sym] = product.at(key).try(:text) }
      obj_params[:id] = obj_params.delete :product_id

      Product.create! obj_params
    end
  end

end
