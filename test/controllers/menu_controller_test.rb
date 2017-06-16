require 'test_helper'

class MenuControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get menu_home_url
    assert_response :success
  end

  test "should get team" do
    get menu_team_url
    assert_response :success
  end

  test "should get patient" do
    get menu_patient_url
    assert_response :success
  end

  test "should get about" do
    get menu_about_url
    assert_response :success
  end

  test "should get sports" do
    get menu_sports_url
    assert_response :success
  end

  test "should get wellness" do
    get menu_wellness_url
    assert_response :success
  end

  test "should get stories" do
    get menu_stories_url
    assert_response :success
  end

  test "should get blog" do
    get menu_blog_url
    assert_response :success
  end

  test "should get contact" do
    get menu_contact_url
    assert_response :success
  end

end
