class Index::UsersController < IndexController
  layout "user"
  before_action :set_side_nav
  before_action :set_all_category

  def index
    redirect_to '/' if !@user
  end

  def tag
    tag = Admin::Tag.find_by_name(params[:name])
    @all_articles = tag.articles.page(params[:page]).per(8) if tag
    render 'index'
  end

  def category
    category = Admin::Category.find_by_name(params[:name])
    @all_articles = category.articles.page(params[:page]).per(8) if category
    render 'index'
  end
  private
  def set_side_nav
    @user = Admin::Author.find_by_name(params[:user])
    @all_articles = @user.articles.order("created_at DESC").page(params[:page]).per(8) if @user
    @all_tags = @user.tags if @user
    @all_archives = @user.archives if @user
  end

  def set_all_category
    @all_categories = []
    if @user && @user.categories.where(supcategory_id: nil)
      @user.categories.where(supcategory_id: nil).each {|c| dfs(@all_categories,0,c)}
    end
  end

  def dfs(all_categories,level,node)
    node.level = level
    all_categories.push(node)
    return if node.subcategories.count==0

    level += 1
    node.subcategories.each do |c|
      dfs(all_categories,level,c)
    end
  end
end
