require 'test_helper'

class ComplaintsControllerTest < ActionController::TestCase
  test "should get full count by month" do
    get :full_count_by_month
    assert_response :success
    response_length = JSON.parse(response.body).length
    assert_equal(13, response_length)
  end

  test "should get full count by day" do
    get :full_count_by_day
    assert_response :success
    response_length = JSON.parse(response.body).length
    assert_equal(365, response_length)
  end

  test "should get count by groups" do
    post :count_by_groups, groups: ["case_summary"]
    assert_response :success
    response_length = JSON.parse(response.body).length
    assert_equal(1156, response_length)
  end

  test "should get count by days and groups" do
    post :count_by_day_and_groups, groups: ["case_summary"]
    assert_response :success
    response_length = JSON.parse(response.body).length
    assert_equal(834, response_length)
  end

  test "should get count by months and groups" do
    post :count_by_month_and_groups, groups: ["case_summary"]
    assert_response :success
    response_length = JSON.parse(response.body).length
    assert_equal(1051, response_length)
  end

  test "should get count by area with lat long" do
    post :count_by_area_with_lat_long, latitude: 39.7347110, longitude: -104.9870100, radius: 0.2, groups: ["case_summary"]
    assert_response :success
    response_length = JSON.parse(response.body).length
    assert_equal(27, response_length)
  end

  test "should get count by area with address" do
    post :count_by_area_with_address, address: '1144 Broadway, Denver, CO', radius: 0.2, groups: ["case_summary"]
    assert_response :success
    response_length = JSON.parse(response.body).length
    assert_equal(27, response_length)
  end

  test "should get info for groups" do
    post :info_by_groups, groups: ["case_summary"]
    assert_response :success
    response_length = JSON.parse(response.body).length
    assert_equal(1156, response_length)
  end
end
