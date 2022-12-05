# # app/controllers/olio_items_controller.rb
class OlioItemsController < ApplicationController
  # GET /index
  # This action will render the index pageview app/views/olio_items/index.html.erb
  # We populate the @olio_items instance variable with the return value of the
  # method display_olio_items in the service object OlioItemsApi
  # @return [JSON]
  def index
    @olio_items = OlioItemsApi.new.display_olio_items
  end
end
