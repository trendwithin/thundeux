require "test_helper"

class MemoriesControllerTest < ActionController::TestCase

before(:each) do
  @user = users(:vic)
  @memory = memories(:one)
end

  test 'index page list memories' do
    sign_in @user
    get :index
    assert_response :success
    assert_not_nil assigns(:memories)
  end

  test 'new memory form' do
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
    refute_difference "Memory.count" do
      delete :destroy, id: @memory
    end
  end
end
