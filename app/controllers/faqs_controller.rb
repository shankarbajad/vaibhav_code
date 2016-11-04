class FaqsController < ApplicationController
  def index
    @faqs = Faq.order(:question => :asc)
    @faqs = @faqs.where("LOWER(question) like ? OR LOWER(answer) like ?", "%#{params[:q].downcase}%", "%#{params[:q].downcase}%") if params[:q].present?
    @faqs = @faqs.page(params[:page])
  end

  def show
    @faq = Faq.find params[:id]
  end
end
