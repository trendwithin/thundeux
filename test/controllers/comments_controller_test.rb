require "test_helper"

class CommentsControllerTest < ActionController::TestCase

  before do
    @memory = memories(:one)
  end

  test 'POST: Adds a Comment To an Existing Memory' do
    @user = users(:shane)
    sign_in @user
    assert_difference('Comment.count') do
      post :create, comment: { body: 'Added a Comment'}, memory_id: @memory
      assert_redirected_to memory_path(@memory.id, assigns(:story))
    end
  end

  test 'POST: Unregistered User Can Not Make Comments' do
    refute_difference('Comment.count') do
      post :create, comment: { body: 'Added a Comment' }, memory_id: @memory
      assert_redirected_to root_path
    end
  end


  # test 'new memory' do
  #   get :new
  #   assert_response :success
  # end
end
