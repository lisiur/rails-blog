require 'test_helper'

class Admin::ArchivesControllerTest < ActionController::TestCase
  setup do
    @admin_archive = admin_archives(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_archives)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_archive" do
    assert_difference('Admin::Archive.count') do
      post :create, admin_archive: {  }
    end

    assert_redirected_to admin_archive_path(assigns(:admin_archive))
  end

  test "should show admin_archive" do
    get :show, id: @admin_archive
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_archive
    assert_response :success
  end

  test "should update admin_archive" do
    patch :update, id: @admin_archive, admin_archive: {  }
    assert_redirected_to admin_archive_path(assigns(:admin_archive))
  end

  test "should destroy admin_archive" do
    assert_difference('Admin::Archive.count', -1) do
      delete :destroy, id: @admin_archive
    end

    assert_redirected_to admin_archives_path
  end
end
