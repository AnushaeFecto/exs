class DealsController < ApplicationController


  def show
    @deal = deal.find(params[:id])
  end

  def new
    @deal = Deal.new
  end

  def create
    @deal = Deal.new(deal_params)
    @deal.requester = current_user
    @deal.answerer = item.user
    if @deal.save
      redirect_to deal_path(@deal)
    else
      render :new
    end
  end

  def edit
    @deal = deal.find(params[:id])
  end

  def update
    @deal = deal.find(params[:id])
    @deal.update(deal_params)
    redirect_to user_path(current_user)
  end

  def destroy
    @deal = Deal.find(params[:id])
    @deal.destroy
    redirect_to user_path(current_user)
  end

  # def accept
  #   @deal = Deal.find(params[:id])
  #   if deal.answerer == @deal.requester
  #   @deal.accept
  # end

  # def reject
  #   @deal = Deal.find(params[:id])
  #   @deal.reject
  # end

  private

  def deal_params
    params.require(:deal).permit(:requester_id, :answerer_id, :status)
  end

end



