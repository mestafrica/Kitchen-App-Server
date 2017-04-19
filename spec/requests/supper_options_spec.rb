require 'rails_helper'

RSpec.describe "SupperOptions", type: :request do
  describe "GET /supper_options" do
    it "works! (now write some real specs)" do
      get supper_options_path
      expect(response).to have_http_status(200)
    end
  end
end
