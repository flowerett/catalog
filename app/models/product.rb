class Product < ActiveRecord::Base
  require 'nokogiri'

  XML_KEYS = %w(product_id title description rating price inet_price image)

  has_many :replies, dependent: :destroy

  def self.upload(file)
    xml = Nokogiri::XML(file)
    cnt = 0

    xml.search('product').each do |product|
      obj_params = {}
      XML_KEYS.each{ |key| obj_params[key.to_sym] = product.at(key).try(:text) }
      obj_params[:id] = obj_params.delete :product_id

      unless Product.find_by_id(obj_params[:id])
        p = Product.new obj_params
        cnt += 1 if p.save!
      end
    end

    cnt
  end

end
