# User management
class UsersController < ApplicationController
  before_action :load_resource, only: %i[show edit update destroy]

  # GET /users
  def index
    @users = User.ordered
    @users = @users.search(params[:sSearch]) if params.try(:[], :sSearch).present?
    @users = @users.page(page).per(per_page)
  end

  # GET /users/1
  def show; end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit; end

  # POST /users
  def create
    @user = User.new(safe_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "#{User.model_name.human} was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  def update
    if safe_params[:password].blank?
      safe_params.delete('password')
      safe_params.delete('password_confirmation')

      respond_to do |format|
        if @user.update_without_password(safe_params)
          format.html { redirect_to @user, notice: "#{User.model_name.human} was successfully updated." }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        if @user.update(safe_params)
          format.html { redirect_to @user, notice: "#{User.model_name.human} was successfully updated." }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "#{User.model_name.human} was successfully removed." }
      format.json { head :no_content }
    end
  end

  private

  def load_resource
    @user = User.find(params[:id])
  end

  def safe_params
    safe_attributes = [
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation,
      role_ids: []
    ]
    params.require(:user).permit(safe_attributes)
  end

  def page
    params[:iDisplayStart].to_i / (per_page + 1)
  end

  def per_page
    (params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : @users.count)
  end
end
