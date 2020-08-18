require 'test_helper'

class VksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vk = vks(:one)
  end

  test "should get index" do
    get vks_url
    assert_response :success
  end

  test "should get new" do
    get new_vk_url
    assert_response :success
  end

  test "should create vk" do
    assert_difference('Vk.count') do
      post vks_url, params: { vk: { posted_at: @vk.posted_at, thumb_map_img_as_div: @vk.thumb_map_img_as_div, title: @vk.title, v_like: @vk.v_like, v_views: @vk.v_views } }
    end

    assert_redirected_to vk_url(Vk.last)
  end

  test "should show vk" do
    get vk_url(@vk)
    assert_response :success
  end

  test "should get edit" do
    get edit_vk_url(@vk)
    assert_response :success
  end

  test "should update vk" do
    patch vk_url(@vk), params: { vk: { posted_at: @vk.posted_at, thumb_map_img_as_div: @vk.thumb_map_img_as_div, title: @vk.title, v_like: @vk.v_like, v_views: @vk.v_views } }
    assert_redirected_to vk_url(@vk)
  end

  test "should destroy vk" do
    assert_difference('Vk.count', -1) do
      delete vk_url(@vk)
    end

    assert_redirected_to vks_url
  end
end
