class ProductController < ApplicationController
  def categories
    @categories = getCategories
  end

  def product_list
    cat_id = params[:id]
    @products = getProducts(cat_id)
    @cat_name = getCategoryName(cat_id)
  end

  def product
    prod_id = params[:id]
    @product = getProduct(prod_id)
  end

end
