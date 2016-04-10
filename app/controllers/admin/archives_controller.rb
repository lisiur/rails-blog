class Admin::ArchivesController < AdminController
  before_action :set_admin_archive, only: [:show, :edit, :update, :destroy]

  # GET /admin/archives
  # GET /admin/archives.json
  def index
    @admin_archives = @login_author.archives.order("created_at DESC")
  end

  # GET /admin/archives/1
  # GET /admin/archives/1.json
  def show
  end

  # GET /admin/archives/new
  def new
    @admin_archive = Admin::Archive.new
  end

  # GET /admin/archives/1/edit
  def edit
  end

  # POST /admin/archives
  # POST /admin/archives.json
  def create
    @admin_archive = Admin::Archive.new(admin_archive_params)

    respond_to do |format|
      if @admin_archive.save
        format.html { redirect_to @admin_archive, notice: 'Archive was successfully created.' }
        format.json { render :show, status: :created, location: @admin_archive }
      else
        format.html { render :new }
        format.json { render json: @admin_archive.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/archives/1
  # PATCH/PUT /admin/archives/1.json
  def update
    respond_to do |format|
      if @admin_archive.update(admin_archive_params)
        format.html { redirect_to @admin_archive, notice: 'Archive was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_archive }
      else
        format.html { render :edit }
        format.json { render json: @admin_archive.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/archives/1
  # DELETE /admin/archives/1.json
  def destroy
    @admin_archive.destroy
    respond_to do |format|
      format.html { redirect_to admin_archives_url, notice: 'Archive was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_archive
      @admin_archive = @login_author.archives.find_by_id(params[:id])
      if @admin_archive.nil?
        render html: "<strong>Not Found</strong>".html_safe and return
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_archive_params
      params.fetch(:admin_archive, {})
    end
end
