require "test_helper"

feature "User" do
  scenario "Signs up" do
    visit root_path
    click_link 'Sign up'
    fill_in 'Email', with: 'maude@harrold.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    within(:css, 'div.actions') { click_button 'Sign up' }
    page.must_have_content 'Welcome! You have signed up successfully.'
  end
end

feature "User Signs Up" do
  scenario "blank email and password" do
    visit new_user_registration_path
    within(:css, 'div.actions') { click_button 'Sign up' }
    page.must_have_content 'Email can\'t be blank'
    page.must_have_content 'Password can\'t be blank'
  end
end

feature "User Signs Up" do
  scenario 'Invalid Password Confirmation' do
    visit new_user_registration_path
    fill_in 'Email', with: 'harold.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password1'
    within(:css, 'div.actions') { click_button 'Sign up' }
    page.must_have_content 'Password confirmation doesn\'t match Password'
  end
end

feature 'User signs up' do
  scenario 'email exists' do
    visit new_user_registration_path
    fill_in 'Email', with: users(:admin).email
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    within(:css, 'div.actions') { click_button 'Sign up' }
    page.must_have_content 'Email has already been taken'
  end
end
