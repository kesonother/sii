require 'test_helper'

class ProsControllerTest < ActionController::TestCase
  setup do
    @pro = pros(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pros)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pro" do
    assert_difference('Pro.count') do
      post :create, pro: @pro.attributes
    end

    assert_redirected_to pro_path(assigns(:pro))
  end

  test "should show pro" do
    get :show, id: @pro.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pro.to_param
    assert_response :success
  end

  test "should update pro" do
    put :update, id: @pro.to_param, pro: @pro.attributes
    assert_redirected_to pro_path(assigns(:pro))
  end

  test "should destroy pro" do
    assert_difference('Pro.count', -1) do
      delete :destroy, id: @pro.to_param
    end

    assert_redirected_to pros_path
  end
end
