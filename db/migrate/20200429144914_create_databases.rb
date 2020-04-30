class CreateDatabases < ActiveRecord::Migration[5.2]
  def change
    create_table :databases do |t|
      t.text :ques_s
      t.text :answer
      t.integer :q_id
      t.string :list_name
      t.integer :list_id
      t.boolean :fav
      t.boolean :check
      t.boolean :correct
      t.boolean :incorrect
      t.timestamps
    end
  end
end
