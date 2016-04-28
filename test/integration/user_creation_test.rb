require 'test_helper'

class UserCreationTest < ActionDispatch::IntegrationTest
  test "a user can be created" do
    visit new_user_path

    fill_in "name", with: "Cindy"
    fill_in "Email", with: "me@me.com"
    fill_in "user_name", with: "ck"
    fill_in "Password", with: "password"
    click_button "Create Account"

    assert page.has_content?("Welcome, Cindy!")



  end
end
