require "test_helper"

feature "Memory: Add Comment To Memory" do
  before do
    @memory = memories :one
    @user = users(:shane)
  end

  scenario "User adds comment to an existing memory" do
    skip('Implement Later')
    login @user
    visit memory_path(@memory)
    fill_in "Body", with: "Making a Comment"
    click_button 'Create Comment'
    page.must_have_content @memory.name
    page.must_have_content "Making a Comment"
  end

  scenario 'Empty Comments Are Not Accepted' do
    skip('Implement Later')
    login @user
    visit memory_path(@memory)
    fill_in "Body", with: ''
    click_button 'Create Comment'
    page.must_have_content 'Comment can\'t be blank'
  end
end
