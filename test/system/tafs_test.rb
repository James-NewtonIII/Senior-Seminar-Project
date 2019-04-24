require "application_system_test_case"

class TafsTest < ApplicationSystemTestCase
  setup do
    @taf = tafs(:one)
  end

  test "visiting the index" do
    visit tafs_url
    assert_selector "h1", text: "Tafs"
  end

  test "creating a Taf" do
    visit tafs_url
    click_on "New Taf"

    click_on "Create Taf"

    assert_text "Taf was successfully created"
    click_on "Back"
  end

  test "updating a Taf" do
    visit tafs_url
    click_on "Edit", match: :first

    click_on "Update Taf"

    assert_text "Taf was successfully updated"
    click_on "Back"
  end

  test "destroying a Taf" do
    visit tafs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Taf was successfully destroyed"
  end
end
