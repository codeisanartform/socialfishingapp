require 'test_helper'

class UserTest < ActiveSupport::TestCase
	test "a user should enter their first name" do
		user = User.new
		assert !user.save
		assert !user.errors[:first_name].empty?
	end

	test "a user should enter their last name" do
		user = User.new
		assert !user.save
		assert !user.errors[:last_name].empty?
	end

	test "a user should enter their profile name" do
		user = User.new
		assert !user.save
		assert !user.errors[:profile_name].empty?
	end

	test "a user should have a unquie profile name" do
		user = User.new
		user.profile_name = users(:brad).profile_name

		assert !user.save
		#puts user.errors.inspect
		assert !user.errors[:profile_name].empty?
	end

	test "a user should have a profile name without spaces" do
		user = User.new
		user.profile_name = "My Profile With Spaces"

		assert !user.save
		#puts user.errors.inspect
		assert !user.errors[:profile_name].empty?
		assert user.errors[:profile_name].include?("must be formatted correctly.")
	end
end
