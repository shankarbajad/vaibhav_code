ActiveAdmin.register Company do

  filter :name
  filter :geography

  index :download_links => false do
    id_column
    column :name
    column :logo do |company|
      image_tag company.logo.url, :style => "width: 150px;height: 120px;" if company.logo.present?
    end
    column :motto
    column :geography
    column :description
    actions
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
