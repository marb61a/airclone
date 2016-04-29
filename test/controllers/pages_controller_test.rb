require "test_helper"

class PagesControllerTest < ActionController::TestCase
    test "Should get home"do
        get :home
        assert_response :success
    end
end