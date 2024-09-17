require "test_helper"

class InspectsControllerTest < ActionDispatch::IntegrationTest
  test "should get schedule" do
    get inspects_schedule_url
    assert_response :success
  end

  test "should get dashboard" do
    get inspects_dashboard_url
    assert_response :success
  end
end
