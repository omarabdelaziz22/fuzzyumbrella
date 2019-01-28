require 'rails_helper'

RSpec.describe "Favoritelists", type: :request do
  describe "GET /favoritelists" do
    it "works! (now write some real specs)" do
      get favoritelists_path
      expect(response).to have_http_status(200)
    end
  end
end
