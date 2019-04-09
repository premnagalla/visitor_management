require "application_system_test_case"

class VisitsTest < ApplicationSystemTestCase
  setup do
    @visit = visits(:one)
  end

  test "visiting the index" do
    visit visits_url
    assert_selector "h1", text: "Visits"
  end

  test "creating a Visit" do
    visit visits_url
    click_on "New Visit"

    fill_in "Contact no", with: @visit.contact_no
    fill_in "Email", with: @visit.email
    fill_in "First name", with: @visit.first_name
    fill_in "Govt", with: @visit.govt_id
    fill_in "Govt id type", with: @visit.govt_id_type
    fill_in "Last name", with: @visit.last_name
    fill_in "No of guests", with: @visit.no_of_guests
    fill_in "Tenant", with: @visit.tenant_id
    fill_in "Visit time", with: @visit.visit_time
    fill_in "Visitor", with: @visit.visitor_id
    click_on "Create Visit"

    assert_text "Visit was successfully created"
    click_on "Back"
  end

  test "updating a Visit" do
    visit visits_url
    click_on "Edit", match: :first

    fill_in "Contact no", with: @visit.contact_no
    fill_in "Email", with: @visit.email
    fill_in "First name", with: @visit.first_name
    fill_in "Govt", with: @visit.govt_id
    fill_in "Govt id type", with: @visit.govt_id_type
    fill_in "Last name", with: @visit.last_name
    fill_in "No of guests", with: @visit.no_of_guests
    fill_in "Tenant", with: @visit.tenant_id
    fill_in "Visit time", with: @visit.visit_time
    fill_in "Visitor", with: @visit.visitor_id
    click_on "Update Visit"

    assert_text "Visit was successfully updated"
    click_on "Back"
  end

  test "destroying a Visit" do
    visit visits_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Visit was successfully destroyed"
  end
end
