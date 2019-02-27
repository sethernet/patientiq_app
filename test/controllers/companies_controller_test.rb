require 'test_helper'

class CompaniesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @company = companies(:one)
    sign_in users(:one)
  end

  test "should get index" do
    get companies_url(:index)
    assert_response :success
  end

  test "should get new" do
    get companies_url(:new)
    assert_response :success
  end

  test "should create company" do
    get companies_url(:create), params: { company: { name: "New Company", subdomain: "newdomain" } }
    assert_response :success
  end

  test "should show company" do
    get company_url(:show), params: { id: 1 }
    assert_response :success
  end

  test "should get edit" do
    get edit_companies_url(:edit), params: { id: 1 }
    assert_response :success
  end

  test "should update company" do
    get company_url(:update), params: { company: { name: "Change Name" } }
    assert_response :success
  end

  test "should destroy company" do
    get company_url(:destroy), params: { id: 2}
    assert_response :success
  end
end
