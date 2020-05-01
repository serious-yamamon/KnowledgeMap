class RenameQidColumnToRefferences < ActiveRecord::Migration[5.2]
  def change

    rename_column :refferences, :q_id, :o_id
    rename_column :refferences, :ref_id, :d_id
  end
end
