require "test_helper"
include Devise::TestHelpers
class HomePageLayoutTest < ActionDispatch::IntegrationTest

  test 'home page links' do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", new_user_registration_path
    assert_select "a[href=?]", new_user_session_path
  end

  test 'home page links after user signs in' do
    https!
    get "/users/sign_up"
    assert_response :success
  end

  test "after user logs in a logout" do
    skip 'selection deprecated- invlaid, research'
    https!
    get "/users/sign_up"
    post_via_redirect "/memories", email: users(:shane).email, password: users(:shane).encrypted_password
    assert_equal '/memories', path
    # assert_select 'a[rel="nofollow" data-method="delete" href=?]', destroy_user_session_path
  end
end
