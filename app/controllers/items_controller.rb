class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)

    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  def items_params
    params.require(:item).permit(:name, :price)
  end

end