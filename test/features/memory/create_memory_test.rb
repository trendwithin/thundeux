require "test_helper"

feature "New Memory Fort" do
  scenario "Page Renders" do
    visit new_memory_path
    page.must_have_content "Add A Memory"
    page.wont_have_content "supercalifragilisticexpialidocious"
  end
end

feature "Create New Memory" do
  scenario "Fill Out Form" do
    visit new_memory_path
    fill_in "Name", with: "A New Memory"
    fill_in "Description", with: "A New Description"
    click_on "Create Memory"
    page.must_have_content "A New Memory"
    page.must_have_content "A New Description"
  end
end

feature "Create New Memory" do
  scenario "Empty Data Fields" do
    visit new_memory_path
    click_on "Create Memory"
    page.must_have_content "Name can't be blank"
    page.must_have_content "Description can't be blank"
  end
end
