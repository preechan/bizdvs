require 'test_helper'

class CertificationCategoriesControllerTest < ActionController::TestCase
  setup do
    @certification_category = certification_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:certification_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create certification_category" do
    assert_difference('CertificationCategory.count') do
      post :create, certification_category: { certificationCategory: @certification_category.certificationCategory, microDiscount: @certification_category.microDiscount }
    end

    assert_redirected_to certification_category_path(assigns(:certification_category))
  end

  test "should show certification_category" do
    get :show, id: @certification_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @certification_category
    assert_response :success
  end

  test "should update certification_category" do
    patch :update, id: @certification_category, certification_category: { certificationCategory: @certification_category.certificationCategory, microDiscount: @certification_category.microDiscount }
    assert_redirected_to certification_category_path(assigns(:certification_category))
  end

  test "should destroy certification_category" do
    assert_difference('CertificationCategory.count', -1) do
      delete :destroy, id: @certification_category
    end

    assert_redirected_to certification_categories_path
  end
end
