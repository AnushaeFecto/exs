class UsersController < ApplicationController
  def show
    @user = current_user
    @requester_items = current_user.items
    @answerer_items = current_user.requests
    @deal_requests = []
    Deal.all.each do |deal|
      @deal_requests << deal if @requester_items.include?(answerer.item)
    end
  end


  def edit
    @user = User.find(params[:id])
    redirect_to root_path if @user != current_user

  end

  def update
    @user = current_user


    if @user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :address, :email, :description)
  end
end
