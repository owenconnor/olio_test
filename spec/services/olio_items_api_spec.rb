require 'rails_helper'

describe 'OlioItemsApi' do
  describe "#fetch_olio_items" do
    let(:s3_response) { OlioItemsApi.new.fetch_olio_items }
    it "should fetch data" do
      expect(s3_response).to be_kind_of(String)
    end
  end

  describe "#display_olio_items" do
    let(:parsed_response) { OlioItemsApi.new.display_olio_items }
    it "should parse & update data" do
      expect(parsed_response).to be_kind_of(Array)
      expect(parsed_response.first).to have_key("id")
      expect(parsed_response.first).to have_key("title")
    end
  end
end
