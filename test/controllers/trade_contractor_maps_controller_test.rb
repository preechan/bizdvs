require 'test_helper'

class TradeContractorMapsControllerTest < ActionController::TestCase
  setup do
    @trade_contractor_map = trade_contractor_maps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trade_contractor_maps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trade_contractor_map" do
    assert_difference('TradeContractorMap.count') do
      post :create, trade_contractor_map: { contractor_id: @trade_contractor_map.contractor_id, trade_id: @trade_contractor_map.trade_id }
    end

    assert_redirected_to trade_contractor_map_path(assigns(:trade_contractor_map))
  end

  test "should show trade_contractor_map" do
    get :show, id: @trade_contractor_map
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @trade_contractor_map
    assert_response :success
  end

  test "should update trade_contractor_map" do
    patch :update, id: @trade_contractor_map, trade_contractor_map: { contractor_id: @trade_contractor_map.contractor_id, trade_id: @trade_contractor_map.trade_id }
    assert_redirected_to trade_contractor_map_path(assigns(:trade_contractor_map))
  end

  test "should destroy trade_contractor_map" do
    assert_difference('TradeContractorMap.count', -1) do
      delete :destroy, id: @trade_contractor_map
    end

    assert_redirected_to trade_contractor_maps_path
  end
end
