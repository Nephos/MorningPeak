require 'test_helper'

class ContactsControllerTest < ActionController::TestCase
  setup do
    @contact = contacts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contacts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contact" do
    assert_difference('Contact.count') do
      post :create, contact: { address: @contact.address, client_id: @contact.client_id, department: @contact.department, email: @contact.email, view_at: @contact.view_at, name: @contact.name, note: @contact.note, phone: @contact.phone, postal_code: @contact.postal_code, region: @contact.region }
    end

    assert_redirected_to contact_path(assigns(:contact))
  end

  test "should show contact" do
    get :show, id: @contact
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contact
    assert_response :success
  end

  test "should update contact" do
    patch :update, id: @contact, contact: { address: @contact.address, client_id: @contact.client_id, department: @contact.department, email: @contact.email, view_at: @contact.view_at, name: @contact.name, note: @contact.note, phone: @contact.phone, postal_code: @contact.postal_code, region: @contact.region }
    assert_redirected_to contact_path(assigns(:contact))
  end

  test "should destroy contact" do
    assert_difference('Contact.count', -1) do
      delete :destroy, id: @contact
    end

    assert_redirected_to contacts_path
  end
end
