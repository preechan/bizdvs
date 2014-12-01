require 'test_helper'

class ContractorsControllerTest < ActionController::TestCase
  setup do
    @contractor = contractors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contractors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contractor" do
    assert_difference('Contractor.count') do
      post :create, contractor: { address: @contractor.address, bondingcapacity: @contractor.bondingcapacity, city: @contractor.city, comments: @contractor.comments, email: @contractor.email, firstname: @contractor.firstname, lastname: @contractor.lastname, licenseClass: @contractor.licenseClass, licenseNo: @contractor.licenseNo, name: @contractor.name, phone: @contractor.phone, state: @contractor.state, trade: @contractor.trade, zipcode: @contractor.zipcode }
    end

    assert_redirected_to contractor_path(assigns(:contractor))
  end

  test "should show contractor" do
    get :show, id: @contractor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contractor
    assert_response :success
  end

  test "should update contractor" do
    patch :update, id: @contractor, contractor: { address: @contractor.address, bondingcapacity: @contractor.bondingcapacity, city: @contractor.city, comments: @contractor.comments, email: @contractor.email, firstname: @contractor.firstname, lastname: @contractor.lastname, licenseClass: @contractor.licenseClass, licenseNo: @contractor.licenseNo, name: @contractor.name, phone: @contractor.phone, state: @contractor.state, trade: @contractor.trade, zipcode: @contractor.zipcode }
    assert_redirected_to contractor_path(assigns(:contractor))
  end

  test "should destroy contractor" do
    assert_difference('Contractor.count', -1) do
      delete :destroy, id: @contractor
    end

    assert_redirected_to contractors_path
  end
end
