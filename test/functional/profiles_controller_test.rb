require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  
  test "should get show if logged in" do
    get :show, id: users(:brad).profile_name
    assert_response :success
    assert_template 'profiles/show' 
  end

  test "should render a 404 on a profile page" do
    get :show, id: "doesn't exsist"
    assert_response :not_found
  end

  test "that variable are assigned on successful profile viewing" do
    get :show, id: users(:jack).profile_name
    assert assigns(:user)
    assert_not_empty assigns(:statuses)
  end

  test "that only shows the correct user's statuses" do
  	get :show, id: users(:brad).profile_name
  	assigns(:statuses).each do |status|
  		assert_equal users(:brad), status.user
  	end
  end

end
