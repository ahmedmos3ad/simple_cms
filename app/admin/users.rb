ActiveAdmin.register User do

  permit_params :username, :email, :password, :password_confirmation
  index do
    selectable_column
    id_column
    column :username
    column :email
    column :email
    column :created_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :username
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
  show do |user|
    attributes_table do
      row :id
      row :username
      row :email
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end
end
