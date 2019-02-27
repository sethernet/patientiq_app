require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
  test "should not save Employee without department_id" do
    employee = Employee.new
    assert_not employee.save, "Saved the employee without department_id"
  end
end
