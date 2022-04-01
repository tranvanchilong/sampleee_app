require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get users_new_url
    assert_response :success
  end
  def setup
    @user= users(:michael)
    @other_user = users(:archer)
    end

end
