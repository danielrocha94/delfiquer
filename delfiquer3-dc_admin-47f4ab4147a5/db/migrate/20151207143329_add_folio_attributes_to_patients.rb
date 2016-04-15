class AddFolioAttributesToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :size, :string
    add_column :patients, :gender, :string
    add_column :patients, :mass_index, :float
    add_column :patients, :blood_type, :string
  end
end
