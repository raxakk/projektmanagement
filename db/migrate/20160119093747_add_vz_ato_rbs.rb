class AddVzAtoRbs < ActiveRecord::Migration
  def change
    add_column :rbs, :vza, :integer
  end
end
