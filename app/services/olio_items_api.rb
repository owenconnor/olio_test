# Manages fetch json data from an S3 endpoint
class OlioItemsApi
  # This method fetches data from S3 endpoint (external url)
  # We use a gem ({https://github.com/jnunemaker/httparty HTTParty}) to call the external url
  #
  # @return [String] a string representing list of olio objects
  def fetch_olio_items
    HTTParty.get('https://s3-eu-west-1.amazonaws.com/olio-staging-images/developer/test-articles-v4.json').body
  end

  # This method parses the data from #fetch_olio_items info
  # into an array of json objects and iterates over them. It uses the id
  # from each json object in the array to find any Like objects with that
  # id. It counts the number of Like objects and updates json objects
  # item["reactions"]["likes"] attribute with that number.
  #
  # @return [JSON] an array of json objects representing olio-items.
  #
  def display_olio_items
    JSON.parse(fetch_olio_items).each do |item|
      like_count = Like.where(liked_item_id: item['id']).try(:count).to_i
      item['reactions']['likes'] = like_count
    end
  end
end