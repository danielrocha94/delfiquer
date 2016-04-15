class AddNameToDoctor < ActiveRecord::Migration
  def change
    add_column :doctors, :name, :string
  end
end
