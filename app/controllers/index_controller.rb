class IndexController < ApplicationController
  before_action :set_all_article_types
  before_action :set_login_author


  private
  def set_all_article_types
    @all_article_types = Admin::ArticleType.all
  end

  def set_login_author
    @login_author = Admin::Author.find_by_id(session[:author_id]) if session[:author_id]
  end
end
