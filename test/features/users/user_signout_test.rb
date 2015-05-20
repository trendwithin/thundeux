require "test_helper"

feature "User Logs out" do
  before do
    @user = User.new(email: 'us@them.com', password: 'password')
    @user.save
  end

  scenario 'click log out' do
    login @user
    page.must_have_content 'Signed in successfully.'
    click_link 'Logout'
    page.must_have_content 'Signed out successfully.'
  end
end
