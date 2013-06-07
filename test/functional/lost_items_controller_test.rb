require 'test_helper'

class LostItemsControllerTest < ActionController::TestCase
  setup do
    @lost_item = lost_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lost_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lost_item" do
    assert_difference('LostItem.count') do
      post :create, lost_item: { additional_contact: @lost_item.additional_contact, address: @lost_item.address, cell: @lost_item.cell, email: @lost_item.email, lost_date: @lost_item.lost_date, lost_item: @lost_item.lost_item, lost_item_pic: @lost_item.lost_item_pic, lost_location: @lost_item.lost_location, name: @lost_item.name }
    end

    assert_redirected_to lost_item_path(assigns(:lost_item))
  end

  test "should show lost_item" do
    get :show, id: @lost_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lost_item
    assert_response :success
  end

  test "should update lost_item" do
    put :update, id: @lost_item, lost_item: { additional_contact: @lost_item.additional_contact, address: @lost_item.address, cell: @lost_item.cell, email: @lost_item.email, lost_date: @lost_item.lost_date, lost_item: @lost_item.lost_item, lost_item_pic: @lost_item.lost_item_pic, lost_location: @lost_item.lost_location, name: @lost_item.name }
    assert_redirected_to lost_item_path(assigns(:lost_item))
  end

  test "should destroy lost_item" do
    assert_difference('LostItem.count', -1) do
      delete :destroy, id: @lost_item
    end

    assert_redirected_to lost_items_path
  end
end
