class Manage::AuthorsController < ManageController
  before_action :set_manage_author, only: [:show, :edit, :update, :destroy]

  # GET /manage/authors
  # GET /manage/authors.json
  def index
    @manage_authors = Admin::Author.all
  end

  # GET /manage/authors/1
  # GET /manage/authors/1.json
  def show
  end

  # GET /manage/authors/new
  def new
    @manage_author = Admin::Author.new
  end

  # GET /manage/authors/1/edit
  def edit
  end

  # POST /manage/authors
  # POST /manage/authors.json
  def create
    @manage_author = Admin::Author.new(manage_author_params)

    respond_to do |format|
      if @manage_author.save
        format.html { redirect_to manage_authors_path, notice: '创建成功' }
        format.json { render :show, status: :created, location: @manage_author }
      else
        format.html { render :new }
        format.json { render json: @manage_author.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /manage/authors/1
  # PATCH/PUT /manage/authors/1.json
  def update
    respond_to do |format|
      if @manage_author.update(manage_author_params)
        format.html { redirect_to manage_authors_path, notice: '更新成功.' }
        format.json { render :show, status: :ok, location: @manage_author }
      else
        format.html { render :edit }
        format.json { render json: @manage_author.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manage/authors/1
  # DELETE /manage/authors/1.json
  def destroy
    @manage_author.destroy
    respond_to do |format|
      format.html { redirect_to manage_authors_url, notice: '删除成功.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_manage_author
    @manage_author = Admin::Author.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def manage_author_params
    params.require(:manage_author).permit(:name, :password, :password_confirmation, :email, :avatar)
  end
end
