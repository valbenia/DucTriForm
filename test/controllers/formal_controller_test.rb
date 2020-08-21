require 'test_helper'

class FormalControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get formal_index_url
    assert_response :success
  end

end
