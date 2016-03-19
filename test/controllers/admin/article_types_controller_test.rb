require 'test_helper'

class Admin::ArticleTypesControllerTest < ActionController::TestCase
  setup do
    @admin_article_type = admin_article_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_article_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_article_type" do
    assert_difference('Admin::ArticleType.count') do
      post :create, admin_article_type: { img: @admin_article_type.img, name: @admin_article_type.name }
    end

    assert_redirected_to admin_article_type_path(assigns(:admin_article_type))
  end

  test "should show admin_article_type" do
    get :show, id: @admin_article_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_article_type
    assert_response :success
  end

  test "should update admin_article_type" do
    patch :update, id: @admin_article_type, admin_article_type: { img: @admin_article_type.img, name: @admin_article_type.name }
    assert_redirected_to admin_article_type_path(assigns(:admin_article_type))
  end

  test "should destroy admin_article_type" do
    assert_difference('Admin::ArticleType.count', -1) do
      delete :destroy, id: @admin_article_type
    end

    assert_redirected_to admin_article_types_path
  end
end
