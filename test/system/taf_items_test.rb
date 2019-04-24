require "application_system_test_case"

class TafItemsTest < ApplicationSystemTestCase
  setup do
    @taf_item = taf_items(:one)
  end

  test "visiting the index" do
    visit taf_items_url
    assert_selector "h1", text: "Taf Items"
  end

  test "creating a Taf item" do
    visit taf_items_url
    click_on "New Taf Item"

    check "Ba approval" if @taf_item.ba_approval
    fill_in "Ba reason", with: @taf_item.ba_reason
    fill_in "Dept", with: @taf_item.dept
    fill_in "Estimated amount", with: @taf_item.estimated_amount
    fill_in "Expense date", with: @taf_item.expense_date
    fill_in "Request reason", with: @taf_item.request_reason
    click_on "Create Taf item"

    assert_text "Taf item was successfully created"
    click_on "Back"
  end

  test "updating a Taf item" do
    visit taf_items_url
    click_on "Edit", match: :first

    check "Ba approval" if @taf_item.ba_approval
    fill_in "Ba reason", with: @taf_item.ba_reason
    fill_in "Dept", with: @taf_item.dept
    fill_in "Estimated amount", with: @taf_item.estimated_amount
    fill_in "Expense date", with: @taf_item.expense_date
    fill_in "Request reason", with: @taf_item.request_reason
    click_on "Update Taf item"

    assert_text "Taf item was successfully updated"
    click_on "Back"
  end

  test "destroying a Taf item" do
    visit taf_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Taf item was successfully destroyed"
  end
end
