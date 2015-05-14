require "test_helper"

class StaticPagesControllerTest < ActionController::TestCase
  test 'should get home page' do
    get :home
    assert_response :success
    assert_select "h1", "Welcome"
  end
end
