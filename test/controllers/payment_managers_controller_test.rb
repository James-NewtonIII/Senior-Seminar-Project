require 'test_helper'

class PaymentManagersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @payment_manager = payment_managers(:one)
  end

  test "should get index" do
    get payment_managers_url
    assert_response :success
  end

  test "should get new" do
    get new_payment_manager_url
    assert_response :success
  end

  test "should create payment_manager" do
    assert_difference('PaymentManager.count') do
      post payment_managers_url, params: { payment_manager: {  } }
    end

    assert_redirected_to payment_manager_url(PaymentManager.last)
  end

  test "should show payment_manager" do
    get payment_manager_url(@payment_manager)
    assert_response :success
  end

  test "should get edit" do
    get edit_payment_manager_url(@payment_manager)
    assert_response :success
  end

  test "should update payment_manager" do
    patch payment_manager_url(@payment_manager), params: { payment_manager: {  } }
    assert_redirected_to payment_manager_url(@payment_manager)
  end

  test "should destroy payment_manager" do
    assert_difference('PaymentManager.count', -1) do
      delete payment_manager_url(@payment_manager)
    end

    assert_redirected_to payment_managers_url
  end
end
