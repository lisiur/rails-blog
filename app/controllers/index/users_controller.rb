class Index::UsersController < ApplicationController
  before_action :set_index_user, only: [:show, :edit, :update, :destroy]

  # GET /index/users
  # GET /index/users.json
  def index
    @index_users = Index::User.all
  end

  # GET /index/users/1
  # GET /index/users/1.json
  def show
  end

  # GET /index/users/new
  def new
    @index_user = Index::User.new
  end

  # GET /index/users/1/edit
  def edit
  end

  # POST /index/users
  # POST /index/users.json
  def create
    @index_user = Index::User.new(index_user_params)

    respond_to do |format|
      if @index_user.save
        format.html { redirect_to @index_user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @index_user }
      else
        format.html { render :new }
        format.json { render json: @index_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /index/users/1
  # PATCH/PUT /index/users/1.json
  def update
    respond_to do |format|
      if @index_user.update(index_user_params)
        format.html { redirect_to @index_user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @index_user }
      else
        format.html { render :edit }
        format.json { render json: @index_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /index/users/1
  # DELETE /index/users/1.json
  def destroy
    @index_user.destroy
    respond_to do |format|
      format.html { redirect_to index_users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_index_user
      @index_user = Index::User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def index_user_params
      params.fetch(:index_user, {})
    end
end
