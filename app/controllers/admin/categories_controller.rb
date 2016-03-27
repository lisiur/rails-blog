class Admin::CategoriesController < AdminController
  before_action :set_admin_category, only: [:show, :edit, :update, :destroy]
  before_action :set_all_category, only: [:new, :edit, :update, :create]

  # GET /admin/categories
  # GET /admin/categories.json
  def index
    if params[:supcategory].nil?
      @admin_categories = @login_author.categories.where(supcategory_id: nil)
    else
      @admin_categories = @login_author.categories.where(supcategory_id: params[:supcategory])
    end
  end

  # GET /admin/categories/1
  # GET /admin/categories/1.json
  def show
  end

  # GET /admin/categories/new
  def new
    @admin_category = Admin::Category.new
  end

  # GET /admin/categories/1/edit
  def edit
  end

  # POST /admin/categories
  # POST /admin/categories.json
  def create
    @admin_category = Admin::Category.new(admin_category_params)
    @admin_category.author_id = @login_author.id
    respond_to do |format|
      if @admin_category.save
        format.html { redirect_to admin_categories_path, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @admin_category }
      else
        format.html { render :new }
        format.json { render json: @admin_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/categories/1
  # PATCH/PUT /admin/categories/1.json
  def update
    respond_to do |format|
      if @admin_category.update(admin_category_params)
        format.html { redirect_to admin_categories_path, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_category }
      else
        format.html { render :edit }
        format.json { render json: @admin_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/categories/1
  # DELETE /admin/categories/1.json
  def destroy
    @admin_category.destroy
    respond_to do |format|
      format.html { redirect_to admin_categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_category
      @admin_category = @login_author.categories.find_by_id(params[:id])
      if @admin_category.nil?
        render html: "<strong>Not Found</strong>".html_safe and return
      end
    end

    def set_all_category
      @all_categories = []
      if @login_author.categories.where(supcategory_id: nil)
        @login_author.categories.where(supcategory_id: nil).each {|c| dfs(@all_categories,0,c)}
      end
    end

    def dfs(all_categories,level,node)
      node.name = "&nbsp;&nbsp;&nbsp;"*level+node.name
      all_categories.push([node.name.html_safe,node.id])
      return if node.subcategories.count==0

      level += 1
      node.subcategories.each do |c|
        dfs(all_categories,level,c)
      end
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_category_params
      params.require(:admin_category).permit(:name, :supcategory_id)
    end
end
