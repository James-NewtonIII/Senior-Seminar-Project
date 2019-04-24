require 'test_helper'

class TafItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @taf_item = taf_items(:one)
  end

  test "should get index" do
    get taf_items_url
    assert_response :success
  end

  test "should get new" do
    get new_taf_item_url
    assert_response :success
  end

  test "should create taf_item" do
    assert_difference('TafItem.count') do
      post taf_items_url, params: { taf_item: { ba_approval: @taf_item.ba_approval, ba_reason: @taf_item.ba_reason, dept: @taf_item.dept, estimated_amount: @taf_item.estimated_amount, expense_date: @taf_item.expense_date, request_reason: @taf_item.request_reason } }
    end

    assert_redirected_to taf_item_url(TafItem.last)
  end

  test "should show taf_item" do
    get taf_item_url(@taf_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_taf_item_url(@taf_item)
    assert_response :success
  end

  test "should update taf_item" do
    patch taf_item_url(@taf_item), params: { taf_item: { ba_approval: @taf_item.ba_approval, ba_reason: @taf_item.ba_reason, dept: @taf_item.dept, estimated_amount: @taf_item.estimated_amount, expense_date: @taf_item.expense_date, request_reason: @taf_item.request_reason } }
    assert_redirected_to taf_item_url(@taf_item)
  end

  test "should destroy taf_item" do
    assert_difference('TafItem.count', -1) do
      delete taf_item_url(@taf_item)
    end

    assert_redirected_to taf_items_url
  end
end
