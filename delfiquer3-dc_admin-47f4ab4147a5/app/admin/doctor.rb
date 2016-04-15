ActiveAdmin.register Doctor do
  permit_params :name, :email, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :sign_in_count
    column :created_at
    actions
  end

  form do |f|
    f.inputs "Doctor Details" do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
