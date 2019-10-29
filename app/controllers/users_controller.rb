class UsersController < ApplicationController
  layout :set_layout
  def index
    @users = User.all
    @book = Book.new
    @user = current_user
  end

  def show
    @user = User.find_by(id: params[:id])
    @book = Book.new
    @books = Book.where(user: @user)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "user was successfully updated."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def set_layout
    if action_name == 'show' || 'edit'
      "users"
    else
      "application"
    end
  end
end
