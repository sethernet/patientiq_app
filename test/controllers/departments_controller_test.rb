require 'test_helper'

class DepartmentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @department = departments(:one)
    sign_in users(:one)
  end

  test "should get index" do
    get department_url(:index)
    assert_response :success
  end

  test "should get new" do
    get department_url(:new)
    assert_response :success
  end

  test "should create department" do
    assert_difference('Department.count') do
      get department_url(:create), params: { department: { name: @department.name } }
    end

    assert_redirected_to department_url(Department.last)
  end

  test "should show department" do
    get department_url(:show), params: { id: 1 }
    assert_response :success
  end

  test "should get edit" do
    get department_url(:edit), params: { id: 1 }
    assert_response :success
  end

  test "should update department" do
    get department_url(:update), params: { id: 1, department: { name: "Marketing" } }
    assert_redirected_to department_url(@department)
  end

  test "should destroy department" do
    assert_difference('Department.count', -1) do
      get department_url(:destroy), params: { id: 2 }
    end

    assert_redirected_to departments_url
  end
end
