require 'test_helper'

class ShoppersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shopper = shoppers(:one)
  end

  test "should get index" do
    get shoppers_url
    assert_response :success
  end

  test "should get new" do
    get new_shopper_url
    assert_response :success
  end

  test "should create shopper" do
    assert_difference('Shopper.count') do
      post shoppers_url, params: { shopper: { department: @shopper.department, loyalty: @shopper.loyalty, name: @shopper.name } }
    end

    assert_redirected_to shopper_url(Shopper.last)
  end

  test "should show shopper" do
    get shopper_url(@shopper)
    assert_response :success
  end

  test "should get edit" do
    get edit_shopper_url(@shopper)
    assert_response :success
  end

  test "should update shopper" do
    patch shopper_url(@shopper), params: { shopper: { department: @shopper.department, loyalty: @shopper.loyalty, name: @shopper.name } }
    assert_redirected_to shopper_url(@shopper)
  end

  test "should destroy shopper" do
    assert_difference('Shopper.count', -1) do
      delete shopper_url(@shopper)
    end

    assert_redirected_to shoppers_url
  end
end
