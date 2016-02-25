require 'test_helper'

class ComplaintsControllerTest < ActionController::TestCase
  # test "should create complaint" do
  #   assert_difference('Complaint.count') do
  #     post :create, complaint: { agency: @complaint.agency, case_closed: @complaint.case_closed, case_created: @complaint.case_created, case_status: @complaint.case_status, case_summary: @complaint.case_summary, council_district: @complaint.council_district, customer_zip_code: @complaint.customer_zip_code, first_call_resolution: @complaint.first_call_resolution, incident_address_one: @complaint.incident_address_one, incident_address_two: @complaint.incident_address_two, incident_intersection_one: @complaint.incident_intersection_one, incident_intersection_two: @complaint.incident_intersection_two, incident_zip_code: @complaint.incident_zip_code, latitude: @complaint.latitude, longtitude: @complaint.longtitude, major_area: @complaint.major_area, neighborhood: @complaint.neighborhood, police_district: @complaint.police_district, topic: @complaint.topic, type: @complaint.type }
  #   end
  #
  #   assert_redirected_to complaint_path(assigns(:complaint))
  # end
  #
  # test "should show complaint" do
  #   get :show, id: @complaint
  #   assert_response :success
  # end

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
