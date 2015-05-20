require "test_helper"

feature "Memory: Add Comment To Memory" do
  before do
    @memory = memories :one
  end

  scenario "the test is sound" do
    visit memory_path(@memory)
    fill_in "Body", with: "Making a Comment"
    click_button 'Create Comment'
    page.must_have_content "Making a Comment"
  end
end
