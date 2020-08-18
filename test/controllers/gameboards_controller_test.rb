require 'test_helper'

class GameboardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gameboard = gameboards(:one)
  end

  test "should get index" do
    get gameboards_url
    assert_response :success
  end

  test "should get new" do
    get new_gameboard_url
    assert_response :success
  end

  test "should create gameboard" do
    assert_difference('Gameboard.count') do
      post gameboards_url, params: { gameboard: { expirience: @gameboard.expirience, karma: @gameboard.karma } }
    end

    assert_redirected_to gameboard_url(Gameboard.last)
  end

  test "should show gameboard" do
    get gameboard_url(@gameboard)
    assert_response :success
  end

  test "should get edit" do
    get edit_gameboard_url(@gameboard)
    assert_response :success
  end

  test "should update gameboard" do
    patch gameboard_url(@gameboard), params: { gameboard: { expirience: @gameboard.expirience, karma: @gameboard.karma } }
    assert_redirected_to gameboard_url(@gameboard)
  end

  test "should destroy gameboard" do
    assert_difference('Gameboard.count', -1) do
      delete gameboard_url(@gameboard)
    end

    assert_redirected_to gameboards_url
  end
end
