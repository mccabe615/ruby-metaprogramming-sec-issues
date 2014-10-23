class AddEmailToEmployees < ActiveRecord::Migration
def change
    change_table :employees do |t|
      t.string :email
    end
  end
end
