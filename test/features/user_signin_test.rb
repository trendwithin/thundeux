require "test_helper"

feature "UserSignin" do
  scenario 'Successful login' do
    login
    page.text.must_include "Signed in successfully"
  end
end
