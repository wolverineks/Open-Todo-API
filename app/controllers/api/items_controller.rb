class Api::ItemsController < ApiController
  before_action :authenticated?
 
  def create
    list = List.find(params[:list_id])
    item = Item.new(item_params)
    item.list = list
    if item.save!
      render json: item_params
    else
      render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      render json: item
    else
      render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    begin
      #list = List.find(params[:list_id])
      item = Item.find(params[:id])
      item.destroy!

      render json: {}, status: :no_content
    rescue ActiveRecord::RecordNotFound
      render :json => {}, :status => :not_found
    end
  end

  private

  def item_params
    params.require(:item).permit(:description, :list_id)
  end

end
