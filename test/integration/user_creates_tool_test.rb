require 'test_helper'

class UserCreatesToolTest < ActionDispatch::IntegrationTest
  test "user can create a tool" do
    user = User.create(name: "Liam", email: "me@me.com", user_name: "liam", password: "password", role: 0)

    visit login_path
    fill_in "Username", with: user.user_name
    fill_in "Password", with: "password"
    click_button "Login"

    visit new_user_tool_path(user.id)

    fill_in "Name", with: "sledge hammer"
    fill_in "Price", with: "10.99"
    fill_in "Quantity", with: "15"
    select "house", from: "Category"

    click_button "Create Tool"

    assert_equal user_tool_path(user.id, Tool.last.id), current_path

    within(".tool_info") do
      assert page.has_content?("Tool: sledge hammer")
      assert page.has_content?("Price: 10.99")
      assert page.has_content?("Quantity: 15")
      assert page.has_content?("Category: house")
    end

    # user goes to new form
    # enter data in each field
    # submit data
    # will be taken to that tool's show page
    # and expect to see submitted data

  end
end
