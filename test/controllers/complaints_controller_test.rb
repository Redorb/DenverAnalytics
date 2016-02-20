require 'test_helper'

class ComplaintsControllerTest < ActionController::TestCase
  setup do
    @complaint = complaints(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:complaints)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create complaint" do
    assert_difference('Complaint.count') do
      post :create, complaint: { agency: @complaint.agency, case_closed: @complaint.case_closed, case_created: @complaint.case_created, case_status: @complaint.case_status, case_summary: @complaint.case_summary, council_district: @complaint.council_district, customer_zip_code: @complaint.customer_zip_code, first_call_resolution: @complaint.first_call_resolution, incident_address_one: @complaint.incident_address_one, incident_address_two: @complaint.incident_address_two, incident_intersection_one: @complaint.incident_intersection_one, incident_intersection_two: @complaint.incident_intersection_two, incident_zip_code: @complaint.incident_zip_code, latitude: @complaint.latitude, longtitude: @complaint.longtitude, major_area: @complaint.major_area, neighborhood: @complaint.neighborhood, police_district: @complaint.police_district, topic: @complaint.topic, type: @complaint.type }
    end

    assert_redirected_to complaint_path(assigns(:complaint))
  end

  test "should show complaint" do
    get :show, id: @complaint
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @complaint
    assert_response :success
  end

  test "should update complaint" do
    patch :update, id: @complaint, complaint: { agency: @complaint.agency, case_closed: @complaint.case_closed, case_created: @complaint.case_created, case_status: @complaint.case_status, case_summary: @complaint.case_summary, council_district: @complaint.council_district, customer_zip_code: @complaint.customer_zip_code, first_call_resolution: @complaint.first_call_resolution, incident_address_one: @complaint.incident_address_one, incident_address_two: @complaint.incident_address_two, incident_intersection_one: @complaint.incident_intersection_one, incident_intersection_two: @complaint.incident_intersection_two, incident_zip_code: @complaint.incident_zip_code, latitude: @complaint.latitude, longtitude: @complaint.longtitude, major_area: @complaint.major_area, neighborhood: @complaint.neighborhood, police_district: @complaint.police_district, topic: @complaint.topic, type: @complaint.type }
    assert_redirected_to complaint_path(assigns(:complaint))
  end

  test "should destroy complaint" do
    assert_difference('Complaint.count', -1) do
      delete :destroy, id: @complaint
    end

    assert_redirected_to complaints_path
  end
end
