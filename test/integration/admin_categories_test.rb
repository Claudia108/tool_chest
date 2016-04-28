require 'test_helper'

class AdminCategoriesTest < ActionDispatch::IntegrationTest
  test "logged in admin can view categories index" do
    admin = User.create(
      user_name: "msadmin",
      password: "password",
      role: 1
    )
    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    # execution
    visit categories_path
    # verification
    assert page.has_content?("All Categories")
    # teardown
  end

  test "default logged in user can view categories index" do
    user = User.create(
      user_name: "defaultperson",
      password: "password",
      role: 0
    )
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit categories_path
    assert page.has_content?("All Categories")
    # assert page.has_content?("The page you were looking for doesn't exist.")
  end
end
