require "application_system_test_case"

class NgosTest < ApplicationSystemTestCase
  setup do
    @ngo = ngos(:one)
  end

  test "visiting the index" do
    visit ngos_url
    assert_selector "h1", text: "Ngos"
  end

  test "creating a Ngo" do
    visit ngos_url
    click_on "New Ngo"

    click_on "Create Ngo"

    assert_text "Ngo was successfully created"
    click_on "Back"
  end

  test "updating a Ngo" do
    visit ngos_url
    click_on "Edit", match: :first

    click_on "Update Ngo"

    assert_text "Ngo was successfully updated"
    click_on "Back"
  end

  test "destroying a Ngo" do
    visit ngos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ngo was successfully destroyed"
  end
end
