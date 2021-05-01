class Users::RegistrationsController < Devise::RegistrationsController
  def new
    @role = "buyer"
    @role = params[:role] if params[:role] == "buyer" || params[:role] == "broker" || params[:role] == "admin"
    super
  end

  def create
    # Mark broker as pending to await approval from admin
    params[:user][:role] = "pending_broker" if params[:user][:role] == "broker"
    super
  end
end
