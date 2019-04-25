require "application_system_test_case"

class PaymentManagersTest < ApplicationSystemTestCase
  setup do
    @payment_manager = payment_managers(:one)
  end

  test "visiting the index" do
    visit payment_managers_url
    assert_selector "h1", text: "Payment Managers"
  end

  test "creating a Payment manager" do
    visit payment_managers_url
    click_on "New Payment Manager"

    click_on "Create Payment manager"

    assert_text "Payment manager was successfully created"
    click_on "Back"
  end

  test "updating a Payment manager" do
    visit payment_managers_url
    click_on "Edit", match: :first

    click_on "Update Payment manager"

    assert_text "Payment manager was successfully updated"
    click_on "Back"
  end

  test "destroying a Payment manager" do
    visit payment_managers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Payment manager was successfully destroyed"
  end
end
