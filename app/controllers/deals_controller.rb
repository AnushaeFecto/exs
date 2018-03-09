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
    authorize @deal
    if @deal.save
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
    redirect_to deal_path(@deal)
  end

  def destroy
    @deal.destroy
    redirect_to user_path(current_user)
  end

  # def include_item(item)
  #   @item = Item.find(params[:id])
  #   @deal = Deal.find(params[:id])
  #   DealItem.create(item: @item, deal: @deal)
  #   if @deal.save
  #     redirect_to deal_path(@deal)
  #   end
  # end

  # def exclude_item(item)
  #   @item = Item.find(params[:id])
  #   @deal = Deal.find(params[:id])
  #   DealItem.destroy(item: @item, deal: @deal)
  #   if @deal.save
  #     redirect_to deal_path(@deal)
  #   end
  # end

  # def reject
  #   @deal = Deal.find(params[:id])
  #   @deal.reject
  # end

  private

  def deal_params
    params.require(:deal).permit(:requester_id, :answerer_id, :status, :price, :item_id, :payer)
  end

  def find_deal
    @deal = Deal.find(params[:id])
    authorize @deal
  end

end



