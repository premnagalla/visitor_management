require "application_system_test_case"

class TenantLockersTest < ApplicationSystemTestCase
  setup do
    @tenant_locker = tenant_lockers(:one)
  end

  test "visiting the index" do
    visit tenant_lockers_url
    assert_selector "h1", text: "Tenant Lockers"
  end

  test "creating a Tenant locker" do
    visit tenant_lockers_url
    click_on "New Tenant Locker"

    fill_in "End date", with: @tenant_locker.end_date
    fill_in "Locker", with: @tenant_locker.locker_id
    fill_in "Start date", with: @tenant_locker.start_date
    fill_in "User", with: @tenant_locker.user_id
    click_on "Create Tenant locker"

    assert_text "Tenant locker was successfully created"
    click_on "Back"
  end

  test "updating a Tenant locker" do
    visit tenant_lockers_url
    click_on "Edit", match: :first

    fill_in "End date", with: @tenant_locker.end_date
    fill_in "Locker", with: @tenant_locker.locker_id
    fill_in "Start date", with: @tenant_locker.start_date
    fill_in "User", with: @tenant_locker.user_id
    click_on "Update Tenant locker"

    assert_text "Tenant locker was successfully updated"
    click_on "Back"
  end

  test "destroying a Tenant locker" do
    visit tenant_lockers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tenant locker was successfully destroyed"
  end
end
