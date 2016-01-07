class AddLevelsToPbs < ActiveRecord::Migration
  def change
    add_column :pbs, :l1, :integer
    add_column :pbs, :l2, :integer
    add_column :pbs, :l3, :integer
  end
end
