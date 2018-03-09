class DealItemsController < ApplicationController
  before_action :find_deal_item, only: [:show, :edit, :update, :destroy]

  def index
    @dealitems = policy_scope(DealItem).order(created_at: :desc)
    if params[:search].present?
      @dealitems = DealItem.search(params[:search])
    end
  end

  def show
  end

  def new
    @dealitem = DealItem.new
    authorize @dealitem
  end

  def create
    @dealitem = DealItem.new(dealitem_params)
    @dealitem.user = current_user
    if @dealitem.save
    authorize @dealitem
      redirect_to item_path(@dealitem.deal)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @dealitem.update(dealitem_params)
    redirect_to user_path(current_user)
  end

  def destroy
    @dealitem.destroy
    redirect_to user_path(current_user)
  end

  private

  def dealitem_params
    params.require(:item).permit(:deal_id, :item_id)
  end

  def find_deal_item
    @dealitem = DealItem.find(params[:id])
    authorize @dealitem
  end

end
