class Admin::AuthorsController < AdminController
  before_action :set_admin_author

  # GET /admin/authors
  # GET /admin/authors.json
  def index
  end

  # GET /admin/authors/1
  # GET /admin/authors/1.json
  def show
  end


  # GET /admin/authors/1/edit
  def edit
  end
  def repassword

  end
  def update_password

  end
  # PATCH/PUT /admin/authors/1
  # PATCH/PUT /admin/authors/1.json
  def update
    respond_to do |format|
      if @admin_author.update(admin_author_params)
        format.html { redirect_to @admin_author, notice: 'Author was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_author }
      else
        format.html { render :edit }
        format.json { render json: @admin_author.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_author
      @admin_author = @login_author
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_author_params
      params.fetch(:admin_author, {})
    end
end
