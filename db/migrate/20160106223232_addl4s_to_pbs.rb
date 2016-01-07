class Addl4sToPbs < ActiveRecord::Migration
  def change
    add_column :pbs, :l4, :integer
    add_column :wbs, :l1, :integer
    add_column :wbs, :l2, :integer
    add_column :wbs, :l3, :integer
    add_column :rbs, :l1, :integer
    add_column :rbs, :l2, :integer
  end
end
