require "test_helper"

feature "Tag::CreateTag" do
  before do
    @user = User.new(email: 'us@them.com', password: 'password', role: 'registered')
    @user.save
  end

  scenario "User adds Tags to their Memory" do
    login @user
    visit new_memory_path
    fill_in "Name", with: "A New Memory"
    fill_in "Description", with: "A New Description"
    fill_in "Tags", with: "Vintage Radio"
    click_on "Create Memory"
    page.must_have_content "A New Memory"
    page.must_have_content "A New Description"
    page.must_have_content "Vintage Radio"
  end

  scenario "User adds comma separated tags" do
    login @user
    visit new_memory_path
    fill_in "Name", with: "A New Memory"
    fill_in "Description", with: "A New Description"
    fill_in "Tags", with: "Vintage Radio, 1950s"
    click_on "Create Memory"
    page.must_have_content "A New Memory"
    page.must_have_content "A New Description"
    page.must_have_content "Vintage Radio, 1950s"
  end

  scenario "User Leaves Tags Blank" do
    skip 'How to test for this within Memory controller?'
    login @user
    visit new_memory_path
    fill_in "Name", with: "A New Memory"
    fill_in "Description", with: "A New Description"
    click_on "Create Memory"
    page.must_have_content "Tags can't be blank."
  end
end
