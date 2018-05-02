require "application_system_test_case"

class GitUsersTest < ApplicationSystemTestCase
  test "visiting the home" do
    visit "/"
    assert_selector "h2", text: "favourite language"
    # save_and_open_screenshot
  end

  test "visiting the new" do
    visit "/git_users/new"
    assert_selector "label", text: "Username"
    # save_and_open_screenshot
  end

  test "looks up a user's preference" do
    visit "/git_users/new"
    # save_and_open_screenshot

    fill_in "git_user_username", with: "VincentDesforges"
    # save_and_open_screenshot

    click_on 'Find Favourite'
    # save_and_open_screenshot

    # Should be redirected to Home with new product
    assert_equal git_user_path(GitUser.last), page.current_path
    assert_text "Ruby"
  end
end
