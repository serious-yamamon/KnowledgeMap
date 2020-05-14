class CreateStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :statuses do |t|
      t.integer :user_id
      t.integer :q_id
      t.boolean :correct
      t.timestamps
    end
  end
end
