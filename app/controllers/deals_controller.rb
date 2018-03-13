class DealsController < ApplicationController
  before_action :find_deal, only: [:show, :edit, :update, :destroy]

  def show

  end

  def new
    # @deal = Deal.new
  end

  def create
    # @item = Item.find(params[:deal][:item_ids])
    @deal = Deal.new(deal_params)
    @deal.status = "In negotiation"
    @deal.requester_id = current_user.id
    authorize @deal
    if @deal.save
      create_deal_items(params[:deal][:deal_items][:item_id], params[:deal][:deal_items][:my_item_id], @deal)
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

  def accept_deal
    @deal = Deal.find(params[:deal_id])
    authorize @deal
    if @deal.status == "In negotiation"
      @deal.status = "Offer made"
    else
      @deal.status = "Finalised"
    end
    @deal.last_changed_by = current_user.id
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

  def create_deal_items(ids_of_answerer, ids_of_requester, deal)
    clean_ids = ids_of_answerer.reject { |c| c.empty? }
    clean_my_ids = ids_of_requester.reject { |c| c.empty? }

    clean_ids.each do |id|
      DealItem.create(item_id: id, deal: deal)
    end
    clean_my_ids.each do |id|
      DealItem.create(item_id: id, deal: deal)
    end
  end

  def deal_params
    params.require(:deal).permit(:answerer_id, :price, :payer)
  end

  def find_deal
    @deal = Deal.find(params[:id])
    authorize @deal
  end



end



