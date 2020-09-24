require 'test_helper'

class ManageplayersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get manageplayers_index_url
    assert_response :success
  end

  test "should get show" do
    get manageplayers_show_url
    assert_response :success
  end

end
