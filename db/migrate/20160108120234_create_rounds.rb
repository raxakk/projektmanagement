class CreateRounds < ActiveRecord::Migration
  def change
    drop_table :rounds
    create_table :rounds do |t|
      t.integer :count
      t.integer :member_number

      t.timestamps null: false
    end
  end
end
