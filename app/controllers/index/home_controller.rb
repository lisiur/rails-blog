class Index::HomeController < IndexController
  def index
    @all_articles = Admin::Article.all.order("created_at DESC")

  end
  def show
    @article = Admin::Article.find_by_title(params[:title])
  end

  def tag
    tag = Admin::Tag.find_by_name(params[:name])
    @all_articles = tag.articles if tag
    render 'index'
  end
  def category
    category = Admin::Category.find_by_name(params[:name])
    @all_articles = category.articles if category
    render 'index'
  end
  def user
    user = Admin::Author.find_by_name(params[:name])
    @all_articles = user.articles if user
    render 'index'
  end
  def article_type
    article_type = Admin::ArticleType.find_by_name(params[:name])
    @all_articles = article_type.articles if article_type
    render 'index'
  end
  def search
    render 'index'
  end
end
