class CreateWbs < ActiveRecord::Migration
  def change
    create_table :wbs do |t|
      t.string :name
      t.integer :parent_id
      t.string :beschreibung
      t.date :start
      t.date :end
      t.integer :rb_id
      t.integer :worker_id

      t.timestamps null: false
    end
  end
end
