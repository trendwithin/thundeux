require "test_helper"

feature "UserSignin" do
  before do
    @user = User.new(email: 'us@them.com', password: 'password')
    @user.save
  end

  scenario 'Successful login' do
    # visit new_user_session_path
    login @user
    page.text.must_include "Signed in successfully"
  end

  scenario 'Malformed Email' do
    @user.email = 'usthem.com'
    visit new_user_session_path
    fill_in "Email", with: @user.email
    fill_in "Password", with: "password"
    within(:css, 'div.actions') { click_button 'Log in' }
    page.text.must_include "Invalid email or password."
  end

  scenario 'Incorrect Password' do
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: 'password1'
    within(:css, 'div.actions') { click_button 'Log in' }
    page.text.must_include "Invalid email or password."
  end
end
