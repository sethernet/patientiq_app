class AddColumnsToEmployee < ActiveRecord::Migration[5.2]
  def change
    add_column :employees, :name, :string
    add_column :employees, :phone, :string
    add_column :employees, :address, :string
  end
end
