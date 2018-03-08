class DealsController < ApplicationController
  before_action :find_deal, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    # @deal = Deal.new
  end

  def create
    @item = Item.find(params[:deal][:item_id])
    @deal = Deal.new
    @deal.requester_id = current_user.id
    @deal.answerer_id = @item.user.id
    if @deal.save
      authorize @deal
      DealItem.create(item: @item, deal: @deal)
      redirect_to deal_path(@deal)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @deal.update(deal_params)
    redirect_to user_path(current_user)
  end

  def destroy
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
    params.require(:deal).permit(:requester_id, :answerer_id, :status, :price, :item_id)
  end

  def find_deal
    @deal = Deal.find(params[:id])
    authorize @deal
  end

end



