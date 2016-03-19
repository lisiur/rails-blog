class Admin::ArticlesController < AdminController
  before_action :set_admin_article, only: [:show, :edit, :update, :destroy]
  before_action :set_all_category, only: [:new, :edit, :update, :create]
  before_action :set_all_article_type, only: [:new, :edit, :update, :create]

  # GET /admin/articles
  # GET /admin/articles.json
  def index
    @admin_articles = Admin::Article.all
  end

  # GET /admin/articles/1
  # GET /admin/articles/1.json
  def show
  end

  # GET /admin/articles/new
  def new
    @admin_article = Admin::Article.new
  end

  # GET /admin/articles/1/edit
  def edit
  end

  # POST /admin/articles
  # POST /admin/articles.json
  def create
    @admin_article = Admin::Article.new(admin_article_params)
    @admin_article.tag_names = params["admin_article"]["tag_names"]
    @admin_article.category_ids = params["admin_article"][""]
    respond_to do |format|
      if @admin_article.save
        format.html { redirect_to admin_articles_path, notice: '已创建.' }
        format.json { render :show, status: :created, location: @admin_article }
      else
        format.html { render :new }
        format.json { render json: @admin_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/articles/1
  # PATCH/PUT /admin/articles/1.json
  def update
    respond_to do |format|
      if @admin_article.update(admin_article_params)
        format.html { redirect_to admin_articles_path, notice: '已更新.' }
        format.json { render :show, status: :ok, location: @admin_article }
      else
        format.html { render :edit }
        format.json { render json: @admin_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/articles/1
  # DELETE /admin/articles/1.json
  def destroy
    @admin_article.destroy
    respond_to do |format|
      format.html { redirect_to admin_articles_url, notice: '已删除.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_article
      @admin_article = Admin::Article.find(params[:id])
    end

  def set_all_article_type

    @all_article_types = []
    all_article_types = Admin::ArticleType.all
    all_article_types.each {|t| @all_article_types << [t.name,t.id]}
  end
  def set_all_category
    @all_categories = []
    if Admin::Category.where(supcategory_id: nil)
      Admin::Category.where(supcategory_id: nil).each {|c| dfs(@all_categories,0,c)}
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
    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_article_params
      params.require(:admin_article).permit(:title, :content, :tag_names, :category_ids, :article_type_id)
    end
end
