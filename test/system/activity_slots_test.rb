require "application_system_test_case"

class ActivitySlotsTest < ApplicationSystemTestCase
  setup do
    @activity_slot = activity_slots(:one)
  end

  test "visiting the index" do
    visit activity_slots_url
    assert_selector "h1", text: "Activity Slots"
  end

  test "creating a Activity slot" do
    visit activity_slots_url
    click_on "New Activity Slot"

    click_on "Create Activity slot"

    assert_text "Activity slot was successfully created"
    click_on "Back"
  end

  test "updating a Activity slot" do
    visit activity_slots_url
    click_on "Edit", match: :first

    click_on "Update Activity slot"

    assert_text "Activity slot was successfully updated"
    click_on "Back"
  end

  test "destroying a Activity slot" do
    visit activity_slots_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Activity slot was successfully destroyed"
  end
end
