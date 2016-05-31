ActiveAdmin.register Room do

permit_params :name
  index do
    id_column
    column :name
    actions
  end

  form do |f|
    f.inputs 'Room Details' do
      f.input :name
    end
    f.actions
  end

  filter :name
end
