require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  def setup
    #Deliveries is a global by default
    ActionMailer::Base.deliveries.clear
  end


  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: { name:  "",
                               email: "user@invalid",
                               password:              "foo",
                               password_confirmation: "bar" }
    end
    assert_template 'users/new'
    # assert_select 'div#<CSS id for error explanation>' Need to complete test for successful error message
    # assert_select 'div#<CSS class for field with errors>' Need to complete test for successful error message
  end

  test "valid signup information with account activation" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, user: { name:  "Example User",
                               email: "user@example.com",
                               password:              "password",
                               password_confirmation: "password" }
    end
    # assert_template 'users/show'
    # # assert_not flash.FIll_IN #for testing the flash message
    # assert is_logged_in?
  end
end
