require "application_system_test_case"

class LockersTest < ApplicationSystemTestCase
  setup do
    @locker = lockers(:one)
  end

  test "visiting the index" do
    visit lockers_url
    assert_selector "h1", text: "Lockers"
  end

  test "creating a Locker" do
    visit lockers_url
    click_on "New Locker"

    fill_in "Id", with: @locker.id
    check "Status" if @locker.status
    click_on "Create Locker"

    assert_text "Locker was successfully created"
    click_on "Back"
  end

  test "updating a Locker" do
    visit lockers_url
    click_on "Edit", match: :first

    fill_in "Id", with: @locker.id
    check "Status" if @locker.status
    click_on "Update Locker"

    assert_text "Locker was successfully updated"
    click_on "Back"
  end

  test "destroying a Locker" do
    visit lockers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Locker was successfully destroyed"
  end
end
