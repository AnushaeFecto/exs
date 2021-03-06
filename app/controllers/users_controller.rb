class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def show
    @deal = Deal.new
    @deal.requester_id = current_user.id
    #@requester = User.find(current_user.id)
    #@deal.answerer_id = @item.user.id
  end

  def edit
    redirect_to root_path if @user != current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      sign_in(current_user, :bypass => true)
      flash[:notice] ='Details successfully updated!'
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :address, :email, :description, :password, :photo)
  end

  def find_user
    @user = User.find(params[:id])
    authorize @user
  end

end
