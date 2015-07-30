require "test_helper"

feature "Comment::ApproveComment" do

  before do
    @user = users(:shane)
    @memory = memories(:one)
    @comment = comments(:memory_one_comment)
  end

  scenario "Unapproved Comments Will Not Be Viewable" do
    login @user
    visit memory_path(@memory)
    fill_in 'Body', with: @comment.body
    click_button 'Create Comment'
    page.must_have_content 'Comment Sent, Awaiting Approval.'
    page.wont_have_content @comment.body
  end

  scenario 'Memory Creator Can View Pending Comments' do
    login @user
    visit memory_path(@memory)
    fill_in 'Body', with: @comment.body
    click_button 'Create Comment'
    logout @user
    login users(:vic)
    visit memory_path(@memory)
    page.must_have_content @comment.body
  end

  scenario 'Memory Creator Can Accept a Pending Comment' do
    login users(:vic)
    visit memory_path(@memory)
    click_button 'Approve'
    page.must_have_content 'Comment Approved.'
  end

  scenario 'Memory Creator Can Delete a Pending Comment' do
    login users(:vic)
    visit memory_path(@memory)
    click_button 'Decline'
    page.must_have_content 'Comment Declined.'
    page.wont_have_content @comment.body
  end
end
