require "test_helper"

feature "UserSignin" do
  before do
    @user = User.new(email: 'us@them.com', password: 'password')
    @user.save
  end
  scenario 'Successful login' do
    login @user
    page.text.must_include "Signed in successfully"
  end
end
