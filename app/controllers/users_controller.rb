class UsersController < ApplicationController

  skip_before_action :authorized?, only: [:new, :create]

  def index
    if params[:search]
      @users = User.where("username like ?", "%#{params[:search]}%")
      # @users = User.where(name: params[:search])
    else
      @users = User.all
    end

  end

  def show
    @gift = Gift.new
    @gift_items = GiftItem.all
    find_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def follow
    find_user
    @current_user.followees << @user
    redirect_to user_path(@user)
  end

  def unfollow
    find_user
    @current_user.followed_users.find_by(followee_id: @user.id).destroy
    redirect_to user_path(@user)
  end

  def create_gift
    find_user
    Gift.create(gift_params)
    redirect_to user_path(@user)
  end

  def edit
    find_user
  end

  def update
    find_user
    if @user.valid?
      @user.update(user_params)
      redirect_to @user
    else 
      flash[:errors] = @user.errors.full_messages
      redirect_to edit_user_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    logout
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :location, :bio, :pic)
  end

  def gift_params
    params.require(:gift).permit(:gift_item_id, :receiver_id, :giver_id)
  end

end
