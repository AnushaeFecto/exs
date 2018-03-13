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
    @deal.status = "In negotiation"
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
    @deal.answerer_address = params[:deal][:answerer_address] unless params[:deal][:answerer_address].nil?
    @deal.requester_address = params[:deal][:requester_address] unless params[:deal][:requester_address].nil?
    @deal.update(deal_params)
    redirect_to deal_path(@deal)
  end

  def destroy
    @deal.destroy
    redirect_to user_path(current_user)
  end

  def accept_deal
    @deal = Deal.find(params[:deal_id])
    authorize @deal
    @deal.status = "Finalised"
    #@deal.last_changed_by = current_user.id
    @deal.save
    redirect_to deal_path(@deal)
  end

  def reject_deal
    @deal = Deal.find(params[:deal_id])
    authorize @deal
    @deal.status = "In negotiation"
    @deal.save
    redirect_to deal_path(@deal)
  end

  private

  def deal_params
    params.require(:deal).permit(:requester_id, :answerer_id, :status, :price, :item_id, :payer, :answerer_address, :requester_address)
  end

  def find_deal
    @deal = Deal.find(params[:id])
    authorize @deal
  end



end



