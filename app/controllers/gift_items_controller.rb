class GiftItemsController < ApplicationController

  def index
    @gift_items = GiftItem.all
  end

  def new
    @gift_item = GiftItem.new
  end

  def create
    @gift_item = GiftItem.create(gift_item_params)
    if @gift_item.valid?
      redirect_to gift_items_path
    else
      flash[:errors] = @gift_item.errors.full_messages
      render new_gift_item_path
    end
  end

  private

  def gift_item_params
    params.require(:gift_item).permit(:item)
  end
end
