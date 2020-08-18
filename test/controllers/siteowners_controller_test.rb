require 'test_helper'

class SiteownersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @siteowner = siteowners(:one)
  end

  test "should get index" do
    get siteowners_url
    assert_response :success
  end

  test "should get new" do
    get new_siteowner_url
    assert_response :success
  end

  test "should create siteowner" do
    assert_difference('Siteowner.count') do
      post siteowners_url, params: { siteowner: {  } }
    end

    assert_redirected_to siteowner_url(Siteowner.last)
  end

  test "should show siteowner" do
    get siteowner_url(@siteowner)
    assert_response :success
  end

  test "should get edit" do
    get edit_siteowner_url(@siteowner)
    assert_response :success
  end

  test "should update siteowner" do
    patch siteowner_url(@siteowner), params: { siteowner: {  } }
    assert_redirected_to siteowner_url(@siteowner)
  end

  test "should destroy siteowner" do
    assert_difference('Siteowner.count', -1) do
      delete siteowner_url(@siteowner)
    end

    assert_redirected_to siteowners_url
  end
end
