class OlioItemsController < ApplicationController
  def index
    @olio_items = fetch_olio_items
  end

  def fetch_olio_items
    response = HTTParty.get('https://s3-eu-west-1.amazonaws.com/olio-staging-images/developer/test-articles-v4.json')
    JSON.parse(response.body).each do |item|
      like_count = Like.where(liked_item_id: item["id"]).try(:count).to_i
      item["reactions"]["likes"] = like_count
    end
  end
end