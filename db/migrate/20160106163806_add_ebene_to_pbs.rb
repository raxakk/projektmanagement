class AddEbeneToPbs < ActiveRecord::Migration
  def change
    add_column :pbs, :ebene, :integer
    add_column :wbs, :ebene, :integer
    add_column :rbs, :ebene, :integer
  end
end
