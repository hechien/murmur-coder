require 'test_helper'

class MurmursControllerTest < ActionController::TestCase
  setup do
    @murmur = murmurs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:murmurs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create murmur" do
    assert_difference('Murmur.count') do
      post :create, murmur: { content: @murmur.content, generated_url: @murmur.generated_url }
    end

    assert_redirected_to murmur_path(assigns(:murmur))
  end

  test "should show murmur" do
    get :show, id: @murmur
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @murmur
    assert_response :success
  end

  test "should update murmur" do
    put :update, id: @murmur, murmur: { content: @murmur.content, generated_url: @murmur.generated_url }
    assert_redirected_to murmur_path(assigns(:murmur))
  end

  test "should destroy murmur" do
    assert_difference('Murmur.count', -1) do
      delete :destroy, id: @murmur
    end

    assert_redirected_to murmurs_path
  end
end
