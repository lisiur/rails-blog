class Admin::SessionController < AdminController
  skip_before_action :check_login
  layout false

  def new
  end

  def create
    login_author = Admin::Author.find_by_name(params[:name])
    if login_author && login_author.authenticate(params[:password])
      session[:author_id] = login_author.id
    end
    redirect_to admin_path
  end

  def destroy
    session[:author_id] = nil
    session[:current_weather] = nil #for debugging
    redirect_to root_path
  end

end
