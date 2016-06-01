ActiveAdmin.register User do

  actions :all, except: [:edit, :new]

  index do
    id_column
    column :username
    column :email
    column :created_at
    actions
  end

  filter :email
  filter :username
end
