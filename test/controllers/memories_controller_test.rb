require "test_helper"

class MemoriesControllerTest < ActionController::TestCase

before(:each) do
  # @user = User.new(email: "spl@er.com", password: "password", role: "registered")
  # @user.save
  @user = users(:Vic)
  @memory = memories(:one)
end

  test 'index page list memories' do
    get :index
    assert_response :success
    assert_not_nil assigns(:memories)
  end

  test 'new memory form' do
    # sign_in :registered, @user
    sign_in @user
    assert_response :success
    get :new
    assert_response :success
  end

  test 'post_with_invalid_parameters' do
    sign_in @user
    options = {
      name: '',
      description: ''
    }
    post :create, memory: options
    must_render_template :new
  end

  test 'new memory with valid parameters saves' do
    sign_in @user
    options = {
      name: 'My Recent Memory',
      description: 'This is a description of my memory'
    }
    assert_difference "Memory.count" do
      post:create, memory: options
    end
  end

  test 'EDIT: User Can Update Their Memory' do
    sign_in @user
    options = {
      name: "Edited Memory",
      description: "Making modifications to the Memory"
    }
    patch :update, id: @memory, memory: options
    assert_redirected_to memory_path(assigns(:memory))
    assert_equal "Memory was successfully updated.", flash[:notice]
  end

  test 'EDIT: User can not Update Another Users Memory' do
    @user = users(:shane)
    sign_in @user
    options = {
      name: "Editing Another User Memory",
      description: "This should not be allowed to happen."
    }
    patch :update, id: @memory, memory: options
    refute_equal "Memory was successfully updated.", flash[:notice]
    get :show, id: @memory
    assigns(:memory).must_equal @memory
  end

  test 'Edit: Guest User Can Not Update Registered Users Memory' do
    options = {
      name: "I am an unregistered user",
      description: "I should not be able to modify an existing memory"
    }
    patch :update, id: @memory, memory: options
    refute_equal "Memory was successfully updated.", flash[:notice]
  end

  test 'Delete: Users Are Not Allowed to Delete Memories' do
    skip ('Return to this Test- Passing when it should not in theory')
    sign_out @user
    refute_difference "Memory.count" do
      delete :destroy, id: @memory
    end
  end

  test 'that memories associated comments render' do
    skip ('Come back to this test when comments are implemented further')
    memory = memories(:one)
    comment = comments(:one)
    get :show, id: memory
    must_respond_with :success
    # assigns(:memory).must_equal(memory)
    # assigns(:comment).must_equal(comment)
  end
end
