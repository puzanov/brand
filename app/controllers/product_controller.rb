class ProductController < ApplicationController
include ProductHelper

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
        
    @product.each() do |row|     
      if !row["DETAIL_PICTURE"].nil?
        @image_link = getImageLink(row["DETAIL_PICTURE"].to_s)
      end
      @page_title = row["NAME"]
      @product_price = getProductPrice(prod_id)
      @category_link = getCategory(row["IBLOCK_SECTION_ID"].to_s)
    end
#------------------------получаем свойства    
    @properties = getProperties(prod_id)
    end
end
