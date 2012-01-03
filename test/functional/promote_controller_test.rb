require 'test_helper'

class PromoteControllerTest < ActionController::TestCase
  test "should get verified" do
    get :verified
    assert_response :success
  end

  test "should get reviews" do
    get :reviews
    assert_response :success
  end

  test "should get futured" do
    get :futured
    assert_response :success
  end

  test "should get domain" do
    get :domain
    assert_response :success
  end

  test "should get network" do
    get :network
    assert_response :success
  end

  test "should get widgets" do
    get :widgets
    assert_response :success
  end

  test "should get advertise_quideal" do
    get :advertise_quideal
    assert_response :success
  end

  test "should get advertise_choopro" do
    get :advertise_choopro
    assert_response :success
  end

end
