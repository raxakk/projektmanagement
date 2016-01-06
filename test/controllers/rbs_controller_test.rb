require 'test_helper'

class RbsControllerTest < ActionController::TestCase
  setup do
    @rb = rbs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rbs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rb" do
    assert_difference('Rb.count') do
      post :create, rb: { erfahrung: @rb.erfahrung, name: @rb.name, parent_id: @rb.parent_id, qualifikation: @rb.qualifikation }
    end

    assert_redirected_to rb_path(assigns(:rb))
  end

  test "should show rb" do
    get :show, id: @rb
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rb
    assert_response :success
  end

  test "should update rb" do
    patch :update, id: @rb, rb: { erfahrung: @rb.erfahrung, name: @rb.name, parent_id: @rb.parent_id, qualifikation: @rb.qualifikation }
    assert_redirected_to rb_path(assigns(:rb))
  end

  test "should destroy rb" do
    assert_difference('Rb.count', -1) do
      delete :destroy, id: @rb
    end

    assert_redirected_to rbs_path
  end
end
