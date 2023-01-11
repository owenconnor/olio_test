# The LikesController manages requests for Like Objects
class LikesController < ApplicationController
  # The create method uses the liked_item_id and
  # like_item_type parameters passed from the form:
  # app/views/olio_items/_olio_item.html.erb
  # to create a like object each time the form is submitted
  # eg "like" button clicked
  # It then redirects to the olio_items_path which will
  # display a a list of the olio items with the like count updated
  # if successful
  # @param [Integer] liked_item_id
  # @param [String] liked_item_type
  def create
    @like = Like.new(liked_item_id: like_params[:liked_item_id],
                     liked_item_type: like_params[:liked_item_type])
    if @like.save
      flash[:success] = 'You successfully liked a product'
    else
      flash[:notice] = "We could not record your like, #{@like.errors.full_messages.to_sentence}"
    end
    redirect_to olio_items_path
  end

  private

  # Rails Strong Parameters force you to whitelist the attributes that can be saved.
  # Using a private method to encapsulate the permissible parameters
  # prevents “mass assignment”.
  def like_params
    params.require(:like).permit(:liked_item_id, :liked_item_type)
  end
end
