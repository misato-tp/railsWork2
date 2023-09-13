require "test_helper"

class ReservationsControllerTest < ActionDispatch::IntegrationTest
  test "should get comfirm" do
    get reservations_comfirm_url
    assert_response :success
  end
end
