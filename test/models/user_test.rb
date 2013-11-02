require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
    should have_many(:user_friendships)
    should have_many(:friends)
    
    test "a user should enter first name" do
        user = User.new
        assert !user.save
        assert !user.errors[:first_name].empty?
    end
    
    test "a user should enter user last name" do
        user = User.new
        assert !user.save
        assert !user.errors[:last_name].empty?
    end
    
    test "a user should enter a profile name" do
        user = User.new
        assert !user.save
        assert !user.errors[:profile_name].empty?
    end
    
    test "a user should have a profile name without spaces" do
        user = User.new
        user.profile_name = "Profile with spaces"
        assert !user.save
        assert !user.errors[:profile_name].empty?
        assert user.errors[:profile_name].include?("Must be formatted correctly.")
    end
    
    test "no error when trying to access a friend list" do
        assert_nothing_raised do
            users(:jason).friends
        end
    end
    
    test "that creating friendships on a user works" do
        users(:jason).friends << users(:mike)
        users(:jason).friends.reload
        assert users(:jason).friends.include?(users(:mike))
    end
end
