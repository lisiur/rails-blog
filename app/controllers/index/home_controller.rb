class Index::HomeController < IndexController
  def index
    @all_articles = Admin::Article.all.order("created_at DESC")
    @all_categories = Admin::Category.where(supcategory_id: nil)
  end
end
