require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  test "registered user can login" do
    user = User.create(name: "Rachel", email: "ra@me.com", user_name: "Rachel", password: "mini")

    visit login_path
    fill_in "Username", with: user.user_name
    fill_in "Password", with: "mini"
    click_button "Login"

    assert page.has_content?("Welcome, Rachel!")
  end
end
