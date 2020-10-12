require 'test_helper'

class MessagesControllerTest < ActionController::TestCase
  setup do
    @todo_list = todo_lists(:one)
    @message = messages(:one)
  end

  test "should get index" do
    get :index, params: { todo_list_id: @todo_list }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { todo_list_id: @todo_list }
    assert_response :success
  end

  test "should create message" do
    assert_difference('Message.count') do
      post :create, params: { todo_list_id: @todo_list, message: @message.attributes }
    end

    assert_redirected_to todo_list_message_path(@todo_list, Message.last)
  end

  test "should show message" do
    get :show, params: { todo_list_id: @todo_list, id: @message }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { todo_list_id: @todo_list, id: @message }
    assert_response :success
  end

  test "should update message" do
    put :update, params: { todo_list_id: @todo_list, id: @message, message: @message.attributes }
    assert_redirected_to todo_list_message_path(@todo_list, Message.last)
  end

  test "should destroy message" do
    assert_difference('Message.count', -1) do
      delete :destroy, params: { todo_list_id: @todo_list, id: @message }
    end

    assert_redirected_to todo_list_messages_path(@todo_list)
  end
end
