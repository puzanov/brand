class ProductController < ApplicationController
include ProductHelper
require 'RMagick'

  def categories
    @categories = getCategories
  end

  def product_list
    cat_id = params[:id]
    puts(params[:id])
    @products = getProducts(cat_id)
    @cat_name = getCategoryName(cat_id)
  end

  def product
    prod_id = params[:id]
    @product = getProduct(prod_id)
    
#    img =  Magick::Image.read("http://qwerty.kg/upload/iblock/df7/satellite-l655-s5117-laptop.png")[0]
#    newimg = img.resize_to_fill(225, 300)
#    filepath = Rails.root.join('public', 'uploads', '1234.jpg')
#    newimg.write(filepath)

    @product.each() do |row|     
      if !row["DETAIL_PICTURE"].nil?
        @image_link = getImageLink(row["DETAIL_PICTURE"].to_s)
      end
      @page_title = row["NAME"]
#      @product_price = getProductPrice(prod_id)
      @category_link = getCategory(row["IBLOCK_SECTION_ID"].to_s)
    end
#------------------------получаем свойства    
    @properties = getProperties(prod_id)
    end
end
