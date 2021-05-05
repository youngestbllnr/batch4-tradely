class Users::RegistrationsController < Devise::RegistrationsController
  def new
    @role = 'buyer'
    @role = params[:role] if params[:role] == 'buyer' || params[:role] == 'broker' || params[:role] == 'admin'
    super
  end

  def create
    email = params[:user][:email]
    role = params[:user][:role]

    # Mark broker as pending to await approval from admin
    params[:user][:role] = 'pending_broker' if role == 'broker'

    # Validate administrator accounts
    if role == 'admin' && email != 'admin@tradely.com'
      flash[:danger] = 'This email address does not have access to an admin account.'
      redirect_to root_path
    else
      super
    end
  end
end
