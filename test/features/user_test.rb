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
