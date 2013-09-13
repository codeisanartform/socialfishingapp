require 'test_helper'

class CustomRoutesTest < ActionDispatch::IntegrationTest
  
  test "that /login route opens the login page"  do
  	get '/login'
  	assert_response :success
  end

  test "that /logout route redirects to root directory"  do
  	get '/logout'
  	assert_response :redirect
  	assert_redirected_to '/'
  end

  test "that /register route opens the log in page"  do
  	get '/register'
  	assert_response :success
  end

  #test "that /feed route opens the all statuses page"  do
  #	get '/logout'
  #	assert_response :redirect
  #	assert_redirected_to '/'
  #end

end
