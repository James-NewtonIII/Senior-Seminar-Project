require "application_system_test_case"

class RequestItemsTest < ApplicationSystemTestCase
  setup do
    @request_item = request_items(:one)
  end

  test "visiting the index" do
    visit request_items_url
    assert_selector "h1", text: "Request Items"
  end

  test "creating a Request item" do
    visit request_items_url
    click_on "New Request Item"

    fill_in "Amount", with: @request_item.amount
    check "Ba approval" if @request_item.ba_approval
    fill_in "Ba reason", with: @request_item.ba_reason
    fill_in "Expense type", with: @request_item.expense_type
    fill_in "Reason", with: @request_item.reason
    click_on "Create Request item"

    assert_text "Request item was successfully created"
    click_on "Back"
  end

  test "updating a Request item" do
    visit request_items_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @request_item.amount
    check "Ba approval" if @request_item.ba_approval
    fill_in "Ba reason", with: @request_item.ba_reason
    fill_in "Expense type", with: @request_item.expense_type
    fill_in "Reason", with: @request_item.reason
    click_on "Update Request item"

    assert_text "Request item was successfully updated"
    click_on "Back"
  end

  test "destroying a Request item" do
    visit request_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Request item was successfully destroyed"
  end
end
