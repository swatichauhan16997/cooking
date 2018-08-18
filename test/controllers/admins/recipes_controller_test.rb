require 'test_helper'

class Admins::RecipesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admins_recipes_new_url
    assert_response :success
  end

  test "should get show" do
    get admins_recipes_show_url
    assert_response :success
  end

  test "should get index" do
    get admins_recipes_index_url
    assert_response :success
  end

  test "should get edit" do
    get admins_recipes_edit_url
    assert_response :success
  end

end
