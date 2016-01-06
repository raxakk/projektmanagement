require 'test_helper'

class WbsControllerTest < ActionController::TestCase
  setup do
    @wb = wbs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wbs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wb" do
    assert_difference('Wb.count') do
      post :create, wb: { beschreibung: @wb.beschreibung, end: @wb.end, name: @wb.name, parent_id: @wb.parent_id, rb_id: @wb.rb_id, start: @wb.start, worker_id: @wb.worker_id }
    end

    assert_redirected_to wb_path(assigns(:wb))
  end

  test "should show wb" do
    get :show, id: @wb
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wb
    assert_response :success
  end

  test "should update wb" do
    patch :update, id: @wb, wb: { beschreibung: @wb.beschreibung, end: @wb.end, name: @wb.name, parent_id: @wb.parent_id, rb_id: @wb.rb_id, start: @wb.start, worker_id: @wb.worker_id }
    assert_redirected_to wb_path(assigns(:wb))
  end

  test "should destroy wb" do
    assert_difference('Wb.count', -1) do
      delete :destroy, id: @wb
    end

    assert_redirected_to wbs_path
  end
end
