require 'test_helper'

class StatusesControllerTest < ActionController::TestCase
  setup do
    @status = statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create status" do
         sign_in users(:jason)
    assert_difference('Status.count') do
      post :create, status: { content: @status.content }
    end

    assert_redirected_to status_path(assigns(:status))
  end

  test "should show status" do
    get :show, id: @status
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @status
    assert_response :success
  end

  test "should update status" do
    patch :update, id: @status, status: { content: @status.content }
    assert_redirected_to status_path(assigns(:status))
  end

  test "should destroy status" do
    assert_difference('Status.count', -1) do
      delete :destroy, id: @status
  end

  test "should create status for the user when logged in" do      
    sign_in users(:jason)
    assert_difference('Status.count') do
        post :create, status: { content: @status.content }
    end
    assert_redirect_to status_path(assigns(:status))
  end
  
  test "should create status for the user when logged in" do      
    sign_in users(:jason)
    assert_difference('Status.count') do
        post :create, status: { content: @status.content, user_id: users(:jim).id }
    end
    assert_redirect_to status_path(assigns(:status))
    assert_equal assigns(:status).user_id, users(:jason).id
  end

  test "should update status for the user when logged in" do      
    sign_in users(:jason)
    put :update, id: @status, status: { content: @status.content, user_id: users.(:jim).id }
    assert_redirect_to status_path(assigns(:status))
    assert_equal assigns(:status).user_id, users(:jason).id
  end

  test "should update status for the user when logged in w" do      
    sign_in users(:jason)
    put :update, id: @status
    assert_redirect_to status_path(assigns(:status))
    assert_equal assigns(:status).user_id, users(:jason).id
  end
      
  test "should get new" do
    get :new
    assert_response :redirect
    assert_redirect_to login_path
  end      
      
  test "should get redirect to a new page" do
    sign_in users(:jason)
    get :new
    assert_response :success
  end          

  test "should get redirect to a new status" do
    post :create, status: {content: "Hello"}
      assert_response :redirect
      assert_redirect_to login_path
  end                
    assert_redirected_to statuses_path
  end
end
