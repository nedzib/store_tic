require "test_helper"

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard" do
    get admin_dashboard_url
    assert_response :success
  end

  test "should get table" do
    get admin_table_url
    assert_response :success
  end
end
