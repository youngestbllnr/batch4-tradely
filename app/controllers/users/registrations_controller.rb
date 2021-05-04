class Users::RegistrationsController < Devise::RegistrationsController
  def new
    @role = 'buyer'
    @role = params[:role] if params[:role] == 'buyer' || params[:role] == 'broker' || params[:role] == 'admin'
    super
  end

  def create
    # Mark broker as pending to await approval from admin
    params[:user][:role] = 'pending_broker' if params[:user][:role] == 'broker'
    if params[:user][:role] == 'admin' && params[:user][:email] != 'rosales.carlangel@gmail.com'
      flash[:danger] = 'Invalid email address, this email address does not have access to an admin account.'
      redirect_to root_path
    else
      super
    end
  end
end
