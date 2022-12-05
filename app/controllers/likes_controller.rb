
class LikesController < ApplicationController
  def create
    @like = Like.new(liked_item_id: like_params[:liked_item_id],
                     liked_item_type: like_params[:liked_item_type])
    if @like.save
      flash[:success] = 'You successfully liked a product'
    else
      flash[:notice] = "We could not record your like, #{@like.errors.full_messages.to_sentence}"
    end
    redirect_to olio_items_index_path
  end

  private

  def like_params
    params.require(:like).permit(:liked_item_id, :liked_item_type)
  end
end
