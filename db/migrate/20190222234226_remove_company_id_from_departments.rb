class RemoveCompanyIdFromDepartments < ActiveRecord::Migration[5.2]
  def change
    remove_column :departments, :company_id, :integer
  end
end
