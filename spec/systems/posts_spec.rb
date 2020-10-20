require 'pry'
require 'rails_helper'


RSpec.describe 'signup', type: :system do
  let(:user) { FactoryBot.create(:user) }

  before do
    log_in(user)
    expect(current_path).to eq "/users/#{user.id}"
  end

  scenario 'POST subject_post' do
    visit "/"
    expect(current_path).to eq "/"
    attach_file "Upload file", "/app/assets/images/LinGoChan.png"
    click_on("commit")
  end
end
