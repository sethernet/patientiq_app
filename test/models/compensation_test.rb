require 'test_helper'

class CompensationTest < ActiveSupport::TestCase
  test "should not save Compensation without employee_id" do
    compensation = Compensation.new
    assert_not compensation.save, "Saved the compensation without employee_id"
  end
end
