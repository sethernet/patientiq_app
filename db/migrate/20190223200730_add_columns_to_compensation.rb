class AddColumnsToCompensation < ActiveRecord::Migration[5.2]
  def change
    add_column :compensations, :employee_id, :integer
  end
end
