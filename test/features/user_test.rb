require "test_helper"

feature "User" do
  scenario "Signs up" do
    visit root_path
    click_link 'Sign up'
    #fill_in 'Email', with: users(:user_1).email
    # fill_in 'Password', with: users(:user_1).password
    # fill_in 'Password confirmation', with: users(:user_1).password
    # click_button 'Sign up'
  end
end
