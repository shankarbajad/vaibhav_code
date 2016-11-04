class ReportsController < ApplicationController
  before_action :authenticate_user!

  def index
    @reports = Report.published.page(params[:page])
  end

end
