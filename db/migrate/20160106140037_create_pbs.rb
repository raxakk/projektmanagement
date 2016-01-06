class CreatePbs < ActiveRecord::Migration
  def change
    create_table :pbs do |t|
      t.string :name
      t.integer :parent_id
      t.string :beschreibung

      t.timestamps null: false
    end
  end
end
