class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.integer :salary
      t.string :status
      t.string :position

      t.timestamps
    end
  end
end
