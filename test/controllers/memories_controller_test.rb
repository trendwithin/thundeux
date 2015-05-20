require "test_helper"

class MemoriesControllerTest < ActionController::TestCase
  def test_sanity
    get :index
    assert_response :success
  end
end
