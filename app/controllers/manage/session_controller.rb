class Manage::SessionController < ManageController
  skip_before_action :check_login
  layout :false

  def new
  end

  def create
    session[:manage_id] = 1 if params[:name]=="lisiur"&&params[:password]="lisiur"
    redirect_to manage_path
  end
  def destroy
  end
end
