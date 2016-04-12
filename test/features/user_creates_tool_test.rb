require 'test_helper'

class UserCreatesToolTest < ActionDispatch::IntegrationTest
  test "user can create a tool" do
    visit new_tool_path

    fill_in "Name", with: "Screwdriver"
    fill_in "Price", with: "10.99"
    fill_in "Quantity", with: "15"

    click_button "Create Tool"

    assert_equal tool_path(Tool.last.id), current_path

    within(".tool_info") do
      assert page.has_content?("Tool: Screwdriver")
      assert page.has_content?("Price: 10.99")
      assert page.has_content?("Quantity: 15")
    end

    # user goes to new form
    # enter data in each field
    # submit data
    # will be taken to that tool's show page
    # and expect to see submitted data

  end
end
