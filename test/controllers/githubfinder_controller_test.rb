require 'test_helper'

class GithubfinderControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get githubfinder_index_url
    assert_response :success
  end

end
