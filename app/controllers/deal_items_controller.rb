class DealItemsController < ApplicationController

  def index
    @dealitems = policy_scope(DealItem).order(created_at: :desc)
    if params[:search].present?
      @dealitems = DealItem.search(params[:search])
    end
  end

  def show
    @rental = Rental.new
    @dealitem = DealItem.find(params[:id])
    authorize @dealitem
  end

  def new
    @dealitem = DealItem.new
    authorize @dealitem
  end

  def create
    @dealitem = DealItem.new(dealitem_params)
    authorize @dealitem
    @dealitem.user = current_user
    if @dealitem.save
      redirect_to item_path(@dealitem)
    else
      render :new
    end
  end

  def edit
    @dealitem = DealItem.find(params[:id])
    authorize @dealitem
  end

  def update
    @dealitem = DealItem.find(params[:id])
    authorize @dealitem
    @dealitem.update(dealitem_params)
    redirect_to user_path(current_user)
  end

  def destroy
    @dealitem = DealItem.find(params[:id])
    authorize @dealitem
    @dealitem.destroy
    redirect_to user_path(current_user)
  end

  private

  def dealitem_params
    params.require(:item).permit(:deal_id, :item_id)
  end

end
