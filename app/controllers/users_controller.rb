class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_user, only: [:show,:edit,:update, :destroy]

  def index; end

  def new
    @user = User.new
  end

  def show; end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: "User successfully created."
     else
      render :new, alert: @user.errors.full_messages
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to @user
     else
      render :edit, alert: @user.errors.full_messages
    end
  end

  def destroy
    if @user.destroy
      redirect_to users_path, notice: "User Deleted"
     else
      redirect_to root_path, alert: @user.errors.full_messages
    end
  end

  def set_user
    @user = User.find_by(id: params[:id])
    return redirect_to root_path, alert: "this not a valid user" if @user.nil?
  end

  def user_params
    params.require(:user).permit(:name, :surname, :email, :password, :role_id, :image)
  end
end