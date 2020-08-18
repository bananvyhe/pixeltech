require 'test_helper'

class VoodoosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @voodoo = voodoos(:one)
  end

  test "should get index" do
    get voodoos_url
    assert_response :success
  end

  test "should get new" do
    get new_voodoo_url
    assert_response :success
  end

  test "should create voodoo" do
    assert_difference('Voodoo.count') do
      post voodoos_url, params: { voodoo: {  } }
    end

    assert_redirected_to voodoo_url(Voodoo.last)
  end

  test "should show voodoo" do
    get voodoo_url(@voodoo)
    assert_response :success
  end

  test "should get edit" do
    get edit_voodoo_url(@voodoo)
    assert_response :success
  end

  test "should update voodoo" do
    patch voodoo_url(@voodoo), params: { voodoo: {  } }
    assert_redirected_to voodoo_url(@voodoo)
  end

  test "should destroy voodoo" do
    assert_difference('Voodoo.count', -1) do
      delete voodoo_url(@voodoo)
    end

    assert_redirected_to voodoos_url
  end
end
