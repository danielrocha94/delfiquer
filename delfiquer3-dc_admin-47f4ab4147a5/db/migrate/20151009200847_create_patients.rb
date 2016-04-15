class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :name
      t.string :address
      t.integer :age
      t.integer :doctor_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
