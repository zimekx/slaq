ActiveAdmin.register Message do

  actions :all, except: [:edit, :new]

  index do
    id_column
    column :user
    column :content
    column :room_id
    column :created_at
    actions
  end

  filter :room
  filter :user
end
