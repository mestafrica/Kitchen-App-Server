require 'rails_helper'

RSpec.describe "LunchOptions", type: :request do
  describe "GET /lunch_options" do
    it "works! (now write some real specs)" do
      get lunch_options_path
      expect(response).to have_http_status(200)
    end
  end
end
