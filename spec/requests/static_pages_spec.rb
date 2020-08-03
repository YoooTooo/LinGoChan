require 'rails_helper'

RSpec.describe 'Access to static_pages', type: :request do
  context 'GET #home' do
    before { get root_path }
    it 'responds successfully' do
      expect(response).to have_http_status(:success)
    end
    it "has title 'LinGoChan'" do
      expect(response.body).to include 'LinGoChan'
      expect(response.body).to_not include '/ LinGoChan'
    end
  end

  context 'GET #about' do
    before { get about_path }
    it 'responds successfully' do
      expect(response).to have_http_status(:success)
    end
    it "has title 'LinGoChan / LinGoChanって何'" do
      expect(response.body).to include 'LinGoChan / LinGoChanって何'
    end
  end
end
