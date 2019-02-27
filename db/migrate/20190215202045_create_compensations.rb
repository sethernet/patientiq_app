class CreateCompensations < ActiveRecord::Migration[5.2]
  def change
    create_table :compensations do |t|
      t.belongs_to :employee, index: true
      t.string :salary
      t.string :bonus

      t.timestamps
    end
  end
end
