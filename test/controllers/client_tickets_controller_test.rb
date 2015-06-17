require 'test_helper'

class ClientTicketsControllerTest < ActionController::TestCase
  setup do
    @ticket_client = ticket_clients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ticket_clients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ticket_client" do
    assert_difference('TicketClient.count') do
      post :create, ticket_client: {  }
    end

    assert_redirected_to ticket_client_path(assigns(:ticket_client))
  end

  test "should show ticket_client" do
    get :show, id: @ticket_client
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ticket_client
    assert_response :success
  end

  test "should update ticket_client" do
    patch :update, id: @ticket_client, ticket_client: {  }
    assert_redirected_to ticket_client_path(assigns(:ticket_client))
  end

  test "should destroy ticket_client" do
    assert_difference('TicketClient.count', -1) do
      delete :destroy, id: @ticket_client
    end

    assert_redirected_to ticket_clients_path
  end
end
