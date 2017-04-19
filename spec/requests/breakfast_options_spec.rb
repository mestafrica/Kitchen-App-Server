require 'rails_helper'

RSpec.describe "BreakfastOptions", type: :request do
  describe "GET /breakfast_options" do
    it "works! (now write some real specs)" do
      get breakfast_options_path
      expect(response).to have_http_status(200)
    end
  end
end
