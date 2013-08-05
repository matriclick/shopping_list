require 'test_helper'

class ChefProfilesControllerTest < ActionController::TestCase
  setup do
    @chef_profile = chef_profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chef_profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chef_profile" do
    assert_difference('ChefProfile.count') do
      post :create, chef_profile: { introduction: @chef_profile.introduction, user_id: @chef_profile.user_id }
    end

    assert_redirected_to chef_profile_path(assigns(:chef_profile))
  end

  test "should show chef_profile" do
    get :show, id: @chef_profile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @chef_profile
    assert_response :success
  end

  test "should update chef_profile" do
    put :update, id: @chef_profile, chef_profile: { introduction: @chef_profile.introduction, user_id: @chef_profile.user_id }
    assert_redirected_to chef_profile_path(assigns(:chef_profile))
  end

  test "should destroy chef_profile" do
    assert_difference('ChefProfile.count', -1) do
      delete :destroy, id: @chef_profile
    end

    assert_redirected_to chef_profiles_path
  end
end
