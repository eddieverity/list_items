class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new(item_params)
    if @item.save
      redirect_to '/'
    else
      flash[:errors] = @message.errors.full_messages
      redirect_to :back
    end

  end

  def show
    item = Item.find(params[:item_id])
    respond_to do |format|
      format.json { render json: item }
      format.html { render text: "<h1>Item</h1>" }
    end
  end

private
  def item_params
    params.require(:item).permit(:name)
  end

end
