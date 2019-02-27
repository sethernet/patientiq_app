require 'test_helper'

class EmployeesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @employee = employees(:one)
    sign_in users(:one)
  end

  test "should get index" do
    get employee_url(:index)
    assert_response :success
  end

  test "should get new" do
    get new_employee_url(:new)
    assert_response :success
  end

  test "should get edit" do
    get employee_url(:edit), params: { id: 1 }
    assert_response :success
  end

  test "should update employee" do
    get employee_url(:update), params: { id: 1, employee: {name: "Tim"} }
    assert_redirected_to employee_url(@employee)
  end

  test "should destroy employee" do
    assert_difference('Employee.count', -1) do
      get employee_url(:destroy), params: { id: 2}
    end

    assert_redirected_to employees_url
  end
end

