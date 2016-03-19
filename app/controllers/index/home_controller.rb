class Index::HomeController < IndexController
  def index
    @all_articles = Admin::Article.all.order("created_at DESC")

  end
  def show
    @article = Admin::Article.find_by_title(params[:title])
  end
end
