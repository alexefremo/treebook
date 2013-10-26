require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
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
end
