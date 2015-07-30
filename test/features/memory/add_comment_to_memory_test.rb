require "test_helper"

feature "Memory: Add Comment To Memory" do
  before do
    @memory = memories :one
    @user = users(:shane)
  end

  scenario "User Adds Comment To Another Users Existing Memory" do
    login @user
    visit memory_path(@memory)
    fill_in "Body", with: "Making a Comment"
    click_button 'Create Comment'
    page.must_have_content @memory.name
    page.must_have_content 'Comment Sent, Awaiting Approval.'
  end

  scenario 'Empty Comments Are Not Accepted' do
    login @user
    visit memory_path(@memory)
    fill_in "Body", with: ''
    click_button 'Create Comment'
    page.must_have_content 'Comment can\'t be blank'
  end

  scenario 'Visitors Can Not Comment' do
    visit memory_path(@memory)
    page.wont_have_content 'Add Comment'
  end

  scenario 'Memory User Commenting on Personal Memory Automatically Approvable' do
    @user =  users(:vic)
    login @user
    visit memory_path(@memory)
    fill_in 'Body', with: 'Commenting on a personal memory, no approval required'
    click_button 'Create Comment'
    page.must_have_content 'Commenting on a personal memory, no approval required'
  end
end
