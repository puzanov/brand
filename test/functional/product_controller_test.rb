require 'test_helper'

class ProductControllerTest < ActionController::TestCase
  test "should get categories" do
    get :categories
    assert_response :success
  end

  test "should get product_list" do
    get :product_list
    assert_response :success
  end

  test "should get product" do
    get :product
    assert_response :success
  end

end
