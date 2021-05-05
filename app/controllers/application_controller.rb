class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    case resource.role
    when 'buyer'
      buyer_dashboard_path
    when 'admin'
      admin_dashboard_path
    else
      broker_dashboard_path
    end
  end

  def admin?
    current_user.role == 'admin'
  end

  def broker?
    current_user.role == 'broker'
  end

  def buyer?
    current_user.role == 'buyer'
  end

  def unless_admin
    redirect_to root_path, notice: 'Unauthorized Access.' unless admin?
  end

  def unless_broker
    redirect_to root_path, notice: 'Unauthorized Access. Please wait until your broker account has been approved by an admin.' unless broker?
  end

  def unless_buyer
    redirect_to root_path, notice: 'Unauthorized Access.' unless buyer?
  end

  # Filter Records by Date Range
  def today(query)
    query.where(created_at: Time.current.beginning_of_day..Time.current.end_of_day)
  end

  def this_week(query)
    query.where(created_at: Time.current.beginning_of_week..Time.current.end_of_week)
  end

  def this_month(query)
    query.where(created_at: Time.current.beginning_of_month..Time.current.end_of_month)
  end

  # Sets count of query on specific periods
  def counts(query)
    @today = today(query)
    @this_week = this_week(query)
    @this_month = this_month(query)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:firstname, :lastname, :email, :password, :role) }
  end
end
