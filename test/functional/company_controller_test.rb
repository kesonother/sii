require 'test_helper'

class CompanyControllerTest < ActionController::TestCase
  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get equipe" do
    get :equipe
    assert_response :success
  end

  test "should get carriere" do
    get :carriere
    assert_response :success
  end

  test "should get logo" do
    get :logo
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

  test "should get presse" do
    get :presse
    assert_response :success
  end

end
