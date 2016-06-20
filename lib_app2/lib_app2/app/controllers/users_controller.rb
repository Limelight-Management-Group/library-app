class UsersController < ApplicationController

  before_action :logged_in?, only: [:show]

  def index
    @users = User.all
    render :index
  end

  def new
    @user = User.new
    render :new
  end

  def create

    @user = User.create(user_params)
    login(@user)
    if User.create
    redirect_to "/users/#{@user.id}"
    else
    flash[:error] = "Email already exists. Please try again."
      redirect_to "/users/new"
    end
  end


  def show
    @user = User.find(params[:id])
    render :show
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
