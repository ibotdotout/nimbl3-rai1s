require 'test_helper'

class WelcomeTest < ActionDispatch::IntegrationTest
  test "Anyone can view welcome page" do
    visit root_url
    assert_equal root_url, current_url
    assert has_content?("Hello World")
  end
end
