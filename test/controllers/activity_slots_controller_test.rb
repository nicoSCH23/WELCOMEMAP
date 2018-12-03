require 'test_helper'

class ActivitySlotsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @activity_slot = activity_slots(:one)
  end

  test "should get index" do
    get activity_slots_url
    assert_response :success
  end

  test "should get new" do
    get new_activity_slot_url
    assert_response :success
  end

  test "should create activity_slot" do
    assert_difference('ActivitySlot.count') do
      post activity_slots_url, params: { activity_slot: {  } }
    end

    assert_redirected_to activity_slot_url(ActivitySlot.last)
  end

  test "should show activity_slot" do
    get activity_slot_url(@activity_slot)
    assert_response :success
  end

  test "should get edit" do
    get edit_activity_slot_url(@activity_slot)
    assert_response :success
  end

  test "should update activity_slot" do
    patch activity_slot_url(@activity_slot), params: { activity_slot: {  } }
    assert_redirected_to activity_slot_url(@activity_slot)
  end

  test "should destroy activity_slot" do
    assert_difference('ActivitySlot.count', -1) do
      delete activity_slot_url(@activity_slot)
    end

    assert_redirected_to activity_slots_url
  end
end
