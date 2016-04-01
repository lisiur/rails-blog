class Index::HomeController < IndexController
  def index
    @all_articles = Admin::Article.all.order("created_at DESC").page(params[:page]).per(8)
  end
  def show
    @article = Admin::Article.find_by_title(params[:title])
    @article.update(watch_count:@article.watch_count+1)
  end

  def article_type
    article_type = Admin::ArticleType.find_by_name(params[:name])
    @all_articles = article_type.articles.page(params[:page]).per(8) if article_type
    render 'index'
  end
  def search
    render 'index'
  end
end
