class AddL2ToRb < ActiveRecord::Migration
  def change
    add_column :rbs, :l3, :integer
  end
end
