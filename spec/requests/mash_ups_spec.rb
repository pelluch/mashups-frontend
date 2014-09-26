require 'rails_helper'

RSpec.describe "MashUps", :type => :request do
  describe "GET /mash_ups" do
    it "works! (now write some real specs)" do
      get mash_ups_path
      expect(response).to have_http_status(200)
    end
  end
end
