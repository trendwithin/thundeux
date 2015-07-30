require "test_helper"

feature "Memory::ShowMemory" do
  before do
    @user = users(:vic)
    @memory = memories(:one)
    @shanes_memory = memories(:three)
  end
  scenario "Memories can be viewed from Index" do
    visit root_path
    login @user
    visit memories_path
    within "#memory_#{@memory.id}" do
      click_link "Show"
    end
    page.must_have_content 'Tix from a show'
  end

  scenario 'User can View Other Users Memories' do
    login @user
    visit memories_path
    within "#memory_#{@shanes_memory.id}" do
      click_link "Show"
    end
    page.must_have_content 'Comic Book'
    end
end
