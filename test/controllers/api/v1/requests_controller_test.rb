require 'test_helper'

class Api::V1::RequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get api_v1_requests_create_url
    assert_response :success
  end

  test "should get show" do
    get api_v1_requests_show_url
    assert_response :success
  end

  test "should get add" do
    get api_v1_requests_add_url
    assert_response :success
  end

end
