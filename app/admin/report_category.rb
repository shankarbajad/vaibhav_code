ActiveAdmin.register ReportCategory do

  filter :title

  index :download_links => false do
    id_column
    column :title
    actions
  end

  controller do
    def permitted_params
      params.permit!
    end
  end


end
