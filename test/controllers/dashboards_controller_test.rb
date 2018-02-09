require 'test_helper'

class DashboardsControllerTest < ActionDispatch::IntegrationTest
  test 'render show' do
    get dashboard_path('provider')
    assert_response :success
  end
end
