require 'test_helper'

class CommonPricesControllerTest < ActionController::TestCase
  setup do
    @common_price = common_prices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:common_prices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create common_price" do
    assert_difference('CommonPrice.count') do
      post :create, :common_price => @common_price.attributes
    end

    assert_redirected_to common_price_path(assigns(:common_price))
  end

  test "should show common_price" do
    get :show, :id => @common_price.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @common_price.to_param
    assert_response :success
  end

  test "should update common_price" do
    put :update, :id => @common_price.to_param, :common_price => @common_price.attributes
    assert_redirected_to common_price_path(assigns(:common_price))
  end

  test "should destroy common_price" do
    assert_difference('CommonPrice.count', -1) do
      delete :destroy, :id => @common_price.to_param
    end

    assert_redirected_to common_prices_path
  end
end
