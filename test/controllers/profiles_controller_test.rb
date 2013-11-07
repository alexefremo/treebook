require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: users(:jason).profile_name
    assert_response :success
    assert_template 'profiles/show'
  end

  test "should get show d" do
    get :show, id: "doesn't exist"
    assert_response :not_found
  end
    
  test "should get show f" do
    get :show, id: users(:jason).profile_name
    assert assigns(:user)
    assert_not_empty assigns(:statuses)    
  end

  test "should get show w" do
    get :show, id: users(:jason).profile_name
    assert assigns(:statuses).each do |status|
        assert_equal users(:jason), status.user
    end    
  end
    
end
