require 'test_helper'

class AddAFriendTest < ActionDispatch::IntegrationTest
    def sign_in_as(user,password)
        post login_path, user: {email: user.email, password: password}
    end
    
    
    test "adding friend works" do
        sign_in_as users(:jason), "testing"
        get "/user_friendships/new?friend_id=#{users(:jim).profile_name}"
        assert_responce :success
        assert_difference 'UserFriendship.count' do
        post "/user_friendships", user_friendship: {friend_id: users(:jim).profile_name}
        assert_responce :redirect
        assert_equal "You are now friends with #{users(:jim).profile_name}", flash[:success]
    end
end
