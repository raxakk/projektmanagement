class CreateForms < ActiveRecord::Migration
  def change
    drop_table :forms
    create_table :forms do |t|
      t.decimal :opt, precision: 16, scale: 2
      t.decimal :pes, precision: 16, scale: 2
      t.decimal :real, precision: 16, scale: 2
      t.integer :worker_id
      t.integer :round_id

      t.timestamps null: false
    end
  end
end
