require "application_system_test_case"

class CompensationsTest < ApplicationSystemTestCase
  setup do
    @compensation = compensations(:one)
  end

  test "visiting the index" do
    visit compensations_url
    assert_selector "h1", text: "Compensations"
  end

  test "creating a Compensation" do
    visit compensations_url
    click_on "New Compensation"

    fill_in "Bonus", with: @compensation.bonus
    fill_in "Salary", with: @compensation.salary
    click_on "Create Compensation"

    assert_text "Compensation was successfully created"
    click_on "Back"
  end

  test "updating a Compensation" do
    visit compensations_url
    click_on "Edit", match: :first

    fill_in "Bonus", with: @compensation.bonus
    fill_in "Salary", with: @compensation.salary
    click_on "Update Compensation"

    assert_text "Compensation was successfully updated"
    click_on "Back"
  end

  test "destroying a Compensation" do
    visit compensations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Compensation was successfully destroyed"
  end
end
