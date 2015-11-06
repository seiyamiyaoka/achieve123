require 'test_helper'

class ContactsControllerTest < ActionController::TestCase
  test "should get inquiry" do
    get :inquiry
    assert_response :success
  end

  test "should get confirm" do
    get :confirm
    assert_response :success
  end

  test "should get thankyou" do
    get :thankyou
    assert_response :success
  end

end
