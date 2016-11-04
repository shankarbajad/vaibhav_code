class LegalsController < ApplicationController
  def index
    @legals = Legal.order(:title => :asc)
    @legals = @legals.where("LOWER(title) like ? OR LOWER(content) like ?", "%#{params[:q].downcase}%", "%#{params[:q].downcase}%") if params[:q].present?
    @legals = @legals.page(params[:page])
  end

  def show
    @legal = Legal.find(params[:id])
  end
end
