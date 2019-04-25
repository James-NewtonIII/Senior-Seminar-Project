require 'test_helper'

class TafLineItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @taf_line_item = taf_line_items(:one)
  end

  test "should get index" do
    get taf_line_items_url
    assert_response :success
  end

  test "should get new" do
    get new_taf_line_item_url
    assert_response :success
  end

  test "should create taf_line_item" do
    assert_difference('TafLineItem.count') do
      post taf_line_items_url, params: { taf_line_item: {  } }
    end

    assert_redirected_to taf_line_item_url(TafLineItem.last)
  end

  test "should show taf_line_item" do
    get taf_line_item_url(@taf_line_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_taf_line_item_url(@taf_line_item)
    assert_response :success
  end

  test "should update taf_line_item" do
    patch taf_line_item_url(@taf_line_item), params: { taf_line_item: {  } }
    assert_redirected_to taf_line_item_url(@taf_line_item)
  end

  test "should destroy taf_line_item" do
    assert_difference('TafLineItem.count', -1) do
      delete taf_line_item_url(@taf_line_item)
    end

    assert_redirected_to taf_line_items_url
  end
end
