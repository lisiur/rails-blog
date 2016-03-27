class Manage::ArticleTypesController < ManageController
  before_action :set_manage_article_type, only: [:show, :edit, :update, :destroy]

  # GET /manage/article_types
  # GET /manage/article_types.json
  def index
    @manage_article_types = Admin::ArticleType.all
  end

  # GET /manage/article_types/1
  # GET /manage/article_types/1.json
  def show
  end

  # GET /manage/article_types/new
  def new
    @manage_article_type = Admin::ArticleType.new
  end

  # GET /manage/article_types/1/edit
  def edit
  end

  # POST /manage/article_types
  # POST /manage/article_types.json
  def create
    @manage_article_type = Admin::ArticleType.new(manage_article_type_params)

    respond_to do |format|
      if @manage_article_type.save
        format.html { redirect_to manage_article_types_path, notice: '创建成功.' }
        format.json { render :show, status: :created, location: @manage_article_type }
      else
        format.html { render :new }
        format.json { render json: @manage_article_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /manage/article_types/1
  # PATCH/PUT /manage/article_types/1.json
  def update
    respond_to do |format|
      if @manage_article_type.update(manage_article_type_params)
        format.html { redirect_to manage_article_types_path, notice: '更新成功.' }
        format.json { render :show, status: :ok, location: @manage_article_type }
      else
        format.html { render :edit }
        format.json { render json: @manage_article_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manage/article_types/1
  # DELETE /manage/article_types/1.json
  def destroy
    @manage_article_type.destroy
    respond_to do |format|
      format.html { redirect_to manage_article_types_url, notice: '删除成功.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_manage_article_type
    @manage_article_type = Admin::ArticleType.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def manage_article_type_params
    params.require(:manage_article_type).permit(:name, :img,:glyphicon)
  end
end
