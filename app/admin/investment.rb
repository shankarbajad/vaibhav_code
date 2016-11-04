ActiveAdmin.register Investment do

  filter :title

  index :download_links => false do
    id_column
    column :title
    column :size
    column :description
    column :type
    column :revenue_share
    column :start_date
    column :industry
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
