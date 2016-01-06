class CreateRbs < ActiveRecord::Migration
  def change
    create_table :rbs do |t|
      t.string :name
      t.integer :parent_id
      t.string :qualifikation
      t.string :erfahrung

      t.timestamps null: false
    end
  end
end
