require 'test_helper'

class AdminCategoriesCreateTest < ActionDispatch::IntegrationTest
  test "admin can create categories" do
    admin = User.create(
      user_name: "msadmin",
      password: "password",
      role: 1
    )

    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    # execution
    visit new_admin_categories_path
    fill_in "name", with: "House"
    click_button "Create Category"

    visit categories_path
    # verification
    assert page.has_content?("House")
    # teardown
  end
end
