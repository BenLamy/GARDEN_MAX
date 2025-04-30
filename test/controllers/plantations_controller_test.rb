require "test_helper"

class PlantationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get plantations_new_url
    assert_response :success
  end

  test "should get create" do
    get plantations_create_url
    assert_response :success
  end

  test "should get destroy" do
    get plantations_destroy_url
    assert_response :success
  end
end
