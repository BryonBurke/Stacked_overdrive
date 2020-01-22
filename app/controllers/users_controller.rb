class UsersController < ApplicationController
  before_action :authorize_admin, only: [:destroy]
def index
  @users = User.all
  render :index
end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You've signed up!"
      session[:user_id] = @user.id
      redirect_to "/"
    else
      flash[:alert] = "There was a problem!"
      redirect_to '/signup'
    end
  end

  def edit
    @user = User.find(params[:id])
    render :edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "User updated!"
      redirect_to users_path
    else
      flash[:alert] = "There was a problem!"
      render :edit
  end
end

  def destroy
    @user.find(params[:id])
    @user.destroy
    redirect_to "/"
  end

  private

  def user_params
    params.require(:user).permit(:name, :admin, :password, :password_confirmation)
  end
end
