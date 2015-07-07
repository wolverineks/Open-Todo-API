class Api::ListsController < ApiController
  before_action :authenticated?
 
  def create
    user = User.find(params[:user_id])
    list = List.new(list_params)
    list.user = user
    if list.save
      render json: list_params
    else
      render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    user = User.find(params[:user_id])
    list = List.find(params[:id])
    if list.update(list_params)
      render json: list
    else
      render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
    end
  end
 
  def destroy
    begin
      user = User.find(params[:user_id])
      list = List.find(params[:id])
      list.destroy

      render json: {}, status: :no_content
    rescue ActiveRecord::RecordNotFound
      render :json => {}, :status => :not_found
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :permissions)
  end

end
