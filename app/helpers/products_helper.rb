module ProductsHelper

  def price_for_product(product)
    if product.inet_price.present? && (product.inet_price < product.price)
      [
        content_tag(:div, product.inet_price, :class => 'sale-price'),
        content_tag(:div, product.price, :class => 'disabled-price')
      ].join(' ').html_safe
    else
      content_tag(:div, product.price)
    end
  end
end
