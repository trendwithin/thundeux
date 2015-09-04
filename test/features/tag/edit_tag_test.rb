require "test_helper"

feature "Tag::EditTag" do
  before do
    @user = users(:shane)
    @memory = memories(:three)
  end

  scenario "Correct Memory is Viewed" do
    login @user
    visit memory_path(@memory)
    page.must_have_content "Vintage"
  end

  scenario "Edit the Memory" do
    login @user
    visit edit_memory_path(@memory)
    fill_in 'Name', with: 'Edited Memory'
    fill_in 'Description', with: 'Edited Body'
    fill_in 'Tags', with: 'New Tag'
    click_button 'Update Memory'
    page.must_have_content 'Edited Memory'
    page.must_have_content 'Edited Body'
    page.must_have_content 'New Tag'
  end
end
