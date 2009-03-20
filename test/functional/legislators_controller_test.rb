require 'test_helper'

class LegislatorsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:legislators)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create legislator" do
    assert_difference('Legislator.count') do
      post :create, :legislator => { }
    end

    assert_redirected_to legislator_path(assigns(:legislator))
  end

  test "should show legislator" do
    get :show, :id => legislators(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => legislators(:one).id
    assert_response :success
  end

  test "should update legislator" do
    put :update, :id => legislators(:one).id, :legislator => { }
    assert_redirected_to legislator_path(assigns(:legislator))
  end

  test "should destroy legislator" do
    assert_difference('Legislator.count', -1) do
      delete :destroy, :id => legislators(:one).id
    end

    assert_redirected_to legislators_path
  end
end
