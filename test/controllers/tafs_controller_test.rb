require 'test_helper'

class TafsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @taf = tafs(:one)
  end

  test "should get index" do
    get tafs_url
    assert_response :success
  end

  test "should get new" do
    get new_taf_url
    assert_response :success
  end

  test "should create taf" do
    assert_difference('Taf.count') do
      post tafs_url, params: { taf: {  } }
    end

    assert_redirected_to taf_url(Taf.last)
  end

  test "should show taf" do
    get taf_url(@taf)
    assert_response :success
  end

  test "should get edit" do
    get edit_taf_url(@taf)
    assert_response :success
  end

  test "should update taf" do
    patch taf_url(@taf), params: { taf: {  } }
    assert_redirected_to taf_url(@taf)
  end

  test "should destroy taf" do
    assert_difference('Taf.count', -1) do
      delete taf_url(@taf)
    end

    assert_redirected_to tafs_url
  end
end
