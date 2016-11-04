ActiveAdmin.register User do

  filter :name
  filter :email

  index :download_links => false do
    id_column
    column :name
    column :email
    column :role
    actions
  end

  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :email
      f.input :role
      f.input :profile
      f.input :services
      f.input :location
    end
    f.button :Submit
  end

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  controller do
    def permitted_params
      params.permit! # allow all parameters
    end
  end


end
