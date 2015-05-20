require "test_helper"

class MemoriesControllerTest < ActionController::TestCase
  test 'index page list memories' do
    get :index
    assert_response :success
    assert_not_nil assigns(:memories)
  end

  test 'new memory form' do
    get :new
    assert_response :success
  end

  test 'post_with_invalid_parameters' do
    options = {
      name: '',
      description: ''
    }

    post :create, memory: options
    must_render_template :new
  end
end
