class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :ssn
      t.string :email
      t.string :standing

      t.timestamps
    end
  end
end
