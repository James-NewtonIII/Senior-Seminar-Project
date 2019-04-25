require "application_system_test_case"

class TafLineItemsTest < ApplicationSystemTestCase
  setup do
    @taf_line_item = taf_line_items(:one)
  end

  test "visiting the index" do
    visit taf_line_items_url
    assert_selector "h1", text: "Taf Line Items"
  end

  test "creating a Taf line item" do
    visit taf_line_items_url
    click_on "New Taf Line Item"

    click_on "Create Taf line item"

    assert_text "Taf line item was successfully created"
    click_on "Back"
  end

  test "updating a Taf line item" do
    visit taf_line_items_url
    click_on "Edit", match: :first

    click_on "Update Taf line item"

    assert_text "Taf line item was successfully updated"
    click_on "Back"
  end

  test "destroying a Taf line item" do
    visit taf_line_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Taf line item was successfully destroyed"
  end
end
