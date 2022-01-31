require "test_helper"

class CreateCategoryTest < ActionDispatch::IntegrationTest

  setup do
    @admin_user = User.create(username: "carlos", email: "carlos@test.com", password: "1234567890", admin: true)
  end

  test "get new category form and create category" do
    sign_in_as(@admin_user)
    get "/categories/new"
    assert_response :success
    assert_difference 'Category.count', 1 do
      post categories_path, params: { category: { name: "Pizza" } }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "Pizza", response.body
  end

  test "get new category form and reject invalid category submission" do
    sign_in_as(@admin_user)
    get "/categories/new"
    assert_response :success
    assert_no_difference "Category.count" do
      post categories_path, params: { category: { name: "AB"} }
    end
    assert_select 'div.alert'
    assert_select 'h4.alert-heading'
    assert_match 'errors', response.body
  end
end
