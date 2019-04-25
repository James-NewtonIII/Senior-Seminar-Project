require 'test_helper'

class BudgetApproversControllerTest < ActionDispatch::IntegrationTest
  setup do
    @budget_approver = budget_approvers(:one)
  end

  test "should get index" do
    get budget_approvers_url
    assert_response :success
  end

  test "should get new" do
    get new_budget_approver_url
    assert_response :success
  end

  test "should create budget_approver" do
    assert_difference('BudgetApprover.count') do
      post budget_approvers_url, params: { budget_approver: {  } }
    end

    assert_redirected_to budget_approver_url(BudgetApprover.last)
  end

  test "should show budget_approver" do
    get budget_approver_url(@budget_approver)
    assert_response :success
  end

  test "should get edit" do
    get edit_budget_approver_url(@budget_approver)
    assert_response :success
  end

  test "should update budget_approver" do
    patch budget_approver_url(@budget_approver), params: { budget_approver: {  } }
    assert_redirected_to budget_approver_url(@budget_approver)
  end

  test "should destroy budget_approver" do
    assert_difference('BudgetApprover.count', -1) do
      delete budget_approver_url(@budget_approver)
    end

    assert_redirected_to budget_approvers_url
  end
end
