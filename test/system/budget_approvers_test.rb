require "application_system_test_case"

class BudgetApproversTest < ApplicationSystemTestCase
  setup do
    @budget_approver = budget_approvers(:one)
  end

  test "visiting the index" do
    visit budget_approvers_url
    assert_selector "h1", text: "Budget Approvers"
  end

  test "creating a Budget approver" do
    visit budget_approvers_url
    click_on "New Budget Approver"

    click_on "Create Budget approver"

    assert_text "Budget approver was successfully created"
    click_on "Back"
  end

  test "updating a Budget approver" do
    visit budget_approvers_url
    click_on "Edit", match: :first

    click_on "Update Budget approver"

    assert_text "Budget approver was successfully updated"
    click_on "Back"
  end

  test "destroying a Budget approver" do
    visit budget_approvers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Budget approver was successfully destroyed"
  end
end
