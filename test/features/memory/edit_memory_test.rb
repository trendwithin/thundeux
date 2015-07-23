require "test_helper"
feature "Memory::EditMemory" do
  before do
    @user = users(:Vic)
    @memory = memories(:one)
  end

  scenario "Registered User can Edit Their Personal Memory" do
    login @user
    visit memories_path
    within "#memory_#{@memory.id}" do
      click_link "Edit"
    end
    fill_in 'Name', with: 'Updated name'
    fill_in 'Description', with: 'Updated description'
    click_on 'Update Memory'
    page.must_have_content 'Updated description'
    page.wont_have_content 'Tix from a show'
  end

  scenario 'Registered User May Not Edit Another User Memory' do
   user = users(:shane)
   memory = memories(:one)
   login user
   visit edit_memory_path(memory)
   page.must_have_content 'You are not authorized to perfrom this action.'
  end

  scenario 'unregistered Visitor May Not Edit Another User Memory' do
    memory = memories(:one)
    visit edit_memory_path(memory)
    page.must_have_content 'You are not authorized to perfrom this action.'
  end
end
