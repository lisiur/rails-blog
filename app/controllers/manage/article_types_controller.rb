class Manage::ArticleTypesController < ManageController
  before_action :set_admin_article_type, only: [:show, :edit, :update, :destroy]

  # GET /admin/article_types
  # GET /admin/article_types.json
  def index
    @admin_article_types = Admin::ArticleType.all
  end

  # GET /admin/article_types/1
  # GET /admin/article_types/1.json
  def show
  end

  # GET /admin/article_types/new
  def new
    @admin_article_type = Admin::ArticleType.new
  end

  # GET /admin/article_types/1/edit
  def edit
  end

  # POST /admin/article_types
  # POST /admin/article_types.json
  def create
    @admin_article_type = Admin::ArticleType.new(admin_article_type_params)

    respond_to do |format|
      if @admin_article_type.save
        format.html { redirect_to admin_article_types_path, notice: '创建成功.' }
        format.json { render :show, status: :created, location: @admin_article_type }
      else
        format.html { render :new }
        format.json { render json: @admin_article_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/article_types/1
  # PATCH/PUT /admin/article_types/1.json
  def update
    respond_to do |format|
      if @admin_article_type.update(admin_article_type_params)
        format.html { redirect_to admin_article_types_path, notice: '更新成功.' }
        format.json { render :show, status: :ok, location: @admin_article_type }
      else
        format.html { render :edit }
        format.json { render json: @admin_article_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/article_types/1
  # DELETE /admin/article_types/1.json
  def destroy
    @admin_article_type.destroy
    respond_to do |format|
      format.html { redirect_to admin_article_types_url, notice: '删除成功.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_admin_article_type
    @admin_article_type = Admin::ArticleType.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_article_type_params
    params.require(:admin_article_type).permit(:name, :img,:glyphicon)
  end
end
