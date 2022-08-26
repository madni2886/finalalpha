require 'test_helper'
class CategoriesController<ActionDispatch::IntegrationTest
  test 'should get categories index'do
    get :categories
    assert_response :success
  end
end