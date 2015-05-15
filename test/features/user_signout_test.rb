require "test_helper"

feature "User Logs out" do
  before do
    @user = User.new(email: 'us@them.com', password: 'password')
    @user.save
  end

  scenario 'click log out' do
    login @user
    click_on 'Log out'
    page.must_have_content 'Signed out successfully.'
  end
end
