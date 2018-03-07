class ItemsController < ApplicationController
  before_action :find_item, only: [:show, :edit, :update, :destroy]

 def index

  # @items_index = Item.all

    puts params
    @categories = ["Dress", "Shoes", "Shirts", "Bags", "Blouse", "Skirt", "Trousers", "Suits", "Shirts", "Tuxedo"]
    # @items = policy_scope(Item).order(created_at: :desc)
    # search from the homepage
    @search = params[:search]
    if params[:search].present?
      @items = Item.search(params[:search])
    else
      @items = Item.all
    end
    #additional search filter from index
    if params[:item_size]
      @items = Item.search(params[:item_size][:search]).searchsize(params[:item_size][:size])
    end

    if params[:item_category]
      @items = Item.search(params[:item_category][:search]).searchcategory(params[:item_category][:category])
    end

    if params[:item_color]
      @items = Item.search(params[:item_color][:search]).searchcolor(params[:item_color][:color])
    end

  end

  def show
    @deal = Deal.new
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
     if @item.save
      redirect_to item_path(@item)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to user_path(current_user)
  end

  private

  def item_params
    params.require(:item).permit(:name,:item, :category, :size, :color, :description, :photo)
  end

  def find_item
    @item = Item.find(params[:id])
  end
end
