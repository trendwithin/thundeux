require "test_helper"

feature "New Memory Form" do
  before do
    @user = User.new(email: 'us@them.com', password: 'password', role: 'registered')
    @user.save
  end

  scenario "New Page Renders for User" do
    login @user
    visit new_memory_path
    page.must_have_content "Add A Memory"
    page.wont_have_content "supercalifragilisticexpialidocious"
  end

  scenario "Fill Out New Memory Form" do
    login @user
    visit new_memory_path
    fill_in "Name", with: "A New Memory"
    fill_in "Description", with: "A New Description"
    click_on "Create Memory"
    page.must_have_content "A New Memory"
    page.must_have_content "A New Description"
  end

  scenario "Empty Data Fields" do
    login @user
    visit new_memory_path
    click_on "Create Memory"
    page.must_have_content "Name can't be blank"
    page.must_have_content "Description can't be blank"
  end
end
