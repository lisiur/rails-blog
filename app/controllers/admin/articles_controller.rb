class Admin::ArticlesController < AdminController
  before_action :set_admin_article, only: [:show, :edit, :update, :destroy]
  before_action :set_all_category, only: [:new, :edit, :update, :create]
  before_action :set_all_article_type, only: [:new, :edit, :update, :create]

  # GET /admin/articles
  # GET /admin/articles.json
  def index
    @admin_articles = @login_author.articles
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
    add_author_tags_categories_archive
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
        update_author_tags_categories
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
      @admin_article = @login_author.articles.find_by_id(params[:id])
      if @admin_article.nil?
        render html: "<strong>Not Found</strong>".html_safe and return
      end
    end

  def set_all_article_type

    @all_article_types = []
    all_article_types = Admin::ArticleType.all
    all_article_types.each {|t| @all_article_types << [t.name,t.id]}
  end
  def set_all_category
    @all_categories = []
    if @login_author.categories.where(supcategory_id: nil)
      @login_author.categories.where(supcategory_id: nil).each {|c| dfs(@all_categories,0,c)}
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

  def add_author_tags_categories_archive
    @admin_article.author_id = @login_author.id
    @admin_article.tag_names = params["admin_article"]["tag_names"]
    @admin_article.category_ids = params["admin_article"]["category_ids"]
    archive = @login_author.archives.where({year:Time.now.year,month:Time.now.month})
    archive = Admin::Archive.create(year:Time.now.year,month:Time.now.month,author_id:@login_author.id) if archive.empty?
    @admin_article.archive_id = archive.first.id
    @admin_article.add_categories
    @admin_article.add_tags(@login_author.id)
  end

  def update_author_tags_categories
    @admin_article.tag_names = params["admin_article"]["tag_names"]
    @admin_article.category_ids = params["admin_article"]["category_ids"]
    @admin_article.add_categories
    @admin_article.add_tags(@login_author.id)
  end
    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_article_params
      params.require(:admin_article).permit(:title, :content, :tag_names, :category_ids, :article_type_id)
    end
end
