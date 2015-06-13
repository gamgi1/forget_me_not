require 'test_helper'

class SuitcasesControllerTest < ActionController::TestCase
  setup do
    @suitcase = suitcases(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:suitcases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create suitcase" do
    assert_difference('Suitcase.count') do
      post :create, suitcase: { days: @suitcase.days, gender: @suitcase.gender, name: @suitcase.name }
    end

    assert_redirected_to suitcase_path(assigns(:suitcase))
  end

  test "should show suitcase" do
    get :show, id: @suitcase
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @suitcase
    assert_response :success
  end

  test "should update suitcase" do
    patch :update, id: @suitcase, suitcase: { days: @suitcase.days, gender: @suitcase.gender, name: @suitcase.name }
    assert_redirected_to suitcase_path(assigns(:suitcase))
  end

  test "should destroy suitcase" do
    assert_difference('Suitcase.count', -1) do
      delete :destroy, id: @suitcase
    end

    assert_redirected_to suitcases_path
  end
end
