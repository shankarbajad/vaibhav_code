ActiveAdmin.register Report do

  before_create do |report|
    report.created_by = current_user
  end

  before_update do |report|
    report.last_updated_by = current_user
  end

  filter :title

  form do |f|
    f.inputs "Details" do
      f.input :title
      f.input :status, :collection => Report.statuses.keys.collect{|status| [status,status] }
      f.input :company_id, as: :select, collection: Company.all.collect{|com| [com.name,com.id]}
      f.input :investment_id, as: :select, collection: Investment.all.collect{|p| [p.title,p.id]}
      f.input :report_category
      f.input :description, :as => :ckeditor
      f.input :report_authors, :selected => f.object.authors.map(&:id), :collection => User.admin.order(:email).collect{|user| [user.email,user.id] }
    end
    f.button :Submit
  end

  index :download_links => false do
    id_column
    column :title
    column :status
    column :company_id
    column :investment_id
    column :report_category
    column :document do |report|
      link_to report.document.file.filename, report.document.url if report.document.present?
    end
    column :created_by
    column :last_updated_by
    column :published_at
    actions
  end

  show do
    attributes_table do
      row :id
      row :title
      row :status
      row :company_id
      row :investment_id
      row :report_category
      row :description do
        report.description.html_safe
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
      params.permit!
    end
  end


end
