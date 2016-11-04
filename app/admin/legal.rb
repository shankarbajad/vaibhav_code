ActiveAdmin.register Legal do

  filter :title

  index :download_links => false do
    id_column
    column :title
    column :company_id
    column :investment_id
    column :tags
    column :created_at
    actions
  end

  form do |f|
    f.inputs "Details" do
      f.input :title
      f.input :company_id, as: :select, collection: Company.all.collect{|com| [com.name,com.id]}
      f.input :investment_id, as: :select, collection: Investment.all.collect{|p| [p.title,p.id]}
      f.input :content, :as => :ckeditor
      f.input :tags
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

show do
  attributes_table do
    row :id
    row :title
    row :company_id
    row :investment_id
    row :content do
      legal.content.html_safe
    end
    row :created_by
    row :last_updated_by
    row :published_at
    row :created_at
    row :updated_at
  end
end
  controller do
    def permitted_params
      params.permit! # allow all parameters
    end
  end


end
