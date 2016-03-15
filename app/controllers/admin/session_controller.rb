class Admin::SessionController < AdminController
  skip_before_action :check_login
  layout :false

  def new
  end

  def create
    session[:admin_id] = 1 if params[:name]
    redirect_to admin_path
  end
  def destroy
  end
end
