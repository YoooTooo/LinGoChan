require 'rails_helper'

RSpec.describe 'site layout', type: :system do
  context 'access to root_path' do
    before { visit root_path }
    subject { page }
    it 'has links sach as root_path and about_path' do
      is_expected.to have_link nil, href: root_path, count: 3
      is_expected.to have_link nil, href: about_path, count: 3
    end
  end
end
