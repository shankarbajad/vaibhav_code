module ApplicationHelper
  def company_updates_showable?(current_user,company)
    return false if current_user.nil?
    company.staffs.map(&:user_id).include?(current_user.id) && company.investments.map(&:investor_id).include?(current_user.id)
  end
end
