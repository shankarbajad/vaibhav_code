class VisitorsController < ApplicationController

layout :layout_by_resource

	def index
      if user_signed_in?
        render :file => "app/views/public/index"
      else
        render "index"
      end
    end 
       
    def layout_by_resource
      if user_signed_in?
        "application"
      else
        "minimal"
      end
    end
end
