require 'test_helper'

class RequestItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @request_item = request_items(:one)
  end

  test "should get index" do
    get request_items_url
    assert_response :success
  end

  test "should get new" do
    get new_request_item_url
    assert_response :success
  end

  test "should create request_item" do
    assert_difference('RequestItem.count') do
      post request_items_url, params: { request_item: { amount: @request_item.amount, ba_approval: @request_item.ba_approval, ba_reason: @request_item.ba_reason, expense_type: @request_item.expense_type, reason: @request_item.reason } }
    end

    assert_redirected_to request_item_url(RequestItem.last)
  end

  test "should show request_item" do
    get request_item_url(@request_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_request_item_url(@request_item)
    assert_response :success
  end

  test "should update request_item" do
    patch request_item_url(@request_item), params: { request_item: { amount: @request_item.amount, ba_approval: @request_item.ba_approval, ba_reason: @request_item.ba_reason, expense_type: @request_item.expense_type, reason: @request_item.reason } }
    assert_redirected_to request_item_url(@request_item)
  end

  test "should destroy request_item" do
    assert_difference('RequestItem.count', -1) do
      delete request_item_url(@request_item)
    end

    assert_redirected_to request_items_url
  end
end
