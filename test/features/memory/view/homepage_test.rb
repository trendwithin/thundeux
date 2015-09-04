require "test_helper"

feature "Memory Home Page View" do
  before do
    @user = users(:shane)
  end
  scenario "the page should have related memories" do
    login @user
    page.must_have_content 'Related Memories'
    within('.related-memories') do
      page.must_have_content 'Carnival Glass'
    end
  end

  scenario "there are no related memories" do
    login users(:user)
    page.must_have_content 'No Related Memories'
  end

  scenario 'there should be recent memories' do
    login @user
    page.must_have_content 'Recent Memories'
    within('.recent-memories') do
      page.must_have_content 'Comic Books'
    end
  end
end
