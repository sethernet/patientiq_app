require 'test_helper'

class DepartmentTest < ActiveSupport::TestCase
  test "should save Department" do
    department = Department.new
    assert department.save, "Saved the department without error"
  end
end
