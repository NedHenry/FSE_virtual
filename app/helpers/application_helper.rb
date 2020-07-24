module ApplicationHelper

  def flash_class(level)
    case level.to_sym
        when :notice then "alert alert-info"
        when :success then "alert alert-success"
        when :error then "alert alert-error"
        when :alert then "alert alert-error"
    end
  end

  def clashfinder_name
    "test"
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def resource_class
    User
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def app_base_domain
    case Rails.env
    when "production"
      "upyouralley.org"
    when "staging"
      "54.215.96.239" 
    when "development"
      "localhost"
    end
  end
end
