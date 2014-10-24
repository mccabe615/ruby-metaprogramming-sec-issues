class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.string :body
      t.string :type

      t.timestamps
    end
  end
end
