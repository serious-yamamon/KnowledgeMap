class CreateMylists < ActiveRecord::Migration[5.2]
  def change
    create_table :mylists do |t|
      t.integer :user_id
      t.integer :q_id
      t.timestamps
    end
  end
end
