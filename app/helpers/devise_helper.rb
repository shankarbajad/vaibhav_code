module DeviseHelper
  def devise_error_messages!    
    return "" unless devise_error_messages?
    messages = resource.errors.full_messages.map { |msg| msg }.join(', ')
  end

  def devise_error_messages?    
    !resource.errors.empty?
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end