class CreateRefferences < ActiveRecord::Migration[5.2]
  def change
    create_table :refferences do |t|
      t.integer :q_id
      t.integer :ref_id
      t.timestamps
    end
  end
end
