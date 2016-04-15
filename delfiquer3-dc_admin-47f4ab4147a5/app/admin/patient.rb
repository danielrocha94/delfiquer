ActiveAdmin.register Patient do
  permit_params :name, :address, :age, :doctor_id, :user_id, :avatar, :size, :blood_type, :gender

  show do
    attributes_table do
      row :picture do
        image_tag(resource.avatar.url, height: 100) if resource.avatar.exists?
      end
      row :name
      row :address
      row :age
      row :doctor
      row :user
    end
  end

  index do
    column :name
    column :address
    column :age
    column :doctor
    column :user
    actions
  end

  form do |f|
    f.inputs "Patient Details" do
      f.input :name
      f.input :address
      f.input :age
      f.input :size
      f.input :gender, collection: ['H', 'M']
      f.input :blood_type
      f.input :doctor, as: :select
      f.input :user, as: :select
      f.input :avatar, hint: (image_tag(f.object.avatar.url, height: 100) if resource.avatar.exists?)
    end
    f.actions
  end
end
