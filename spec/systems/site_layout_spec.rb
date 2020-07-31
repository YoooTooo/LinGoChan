
RSpec.describe 'title_description' do
  it 'home_title' do
    visit root_path
#    expect().to eq 2
  end
  it 'about_title' do
    visit about_path
#    expect(10 - 1).to eq 9
  end
end

#========================================================================

RSpec.describe "SiteLayouts", type: :system do
  describe "home layout" do
    it "contains root link" do
      visit root_path
      expect(page).to have_link nil, href: root_path, count: 2
    end

    it "contains login link" do
      visit root_path
      expect(page).to have_link 'Login', href: login_path
    end
  end
end
