class Api::ItemsController < ApiController
  before_action :authenticated?
 
  def create
    item = Item.new(item_params)
    if item.save
      render json: item_params
    else
      render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  def destroy
    begin
      item = Item.find(params[:id])
      item.destroy

      render json: {}, status: :no_content
    rescue ActiveRecord::RecordNotFound
      render :json => {}, :status => :not_found
    end
  end

  private

  def item_params
    params.require(:item).permit(:description)
  end

end
