require 'test_helper'

class IngredientsControllerTest < ActionController::TestCase
  setup do
    @ingredient = ingredients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ingredients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ingredient" do
    assert_difference('Ingredient.count') do
      post :create, ingredient: { description: @ingredient.description, measure_id: @ingredient.measure_id, name: @ingredient.name, price: @ingredient.price, quantity_for_price: @ingredient.quantity_for_price }
    end

    assert_redirected_to ingredient_path(assigns(:ingredient))
  end

  test "should show ingredient" do
    get :show, id: @ingredient
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ingredient
    assert_response :success
  end

  test "should update ingredient" do
    put :update, id: @ingredient, ingredient: { description: @ingredient.description, measure_id: @ingredient.measure_id, name: @ingredient.name, price: @ingredient.price, quantity_for_price: @ingredient.quantity_for_price }
    assert_redirected_to ingredient_path(assigns(:ingredient))
  end

  test "should destroy ingredient" do
    assert_difference('Ingredient.count', -1) do
      delete :destroy, id: @ingredient
    end

    assert_redirected_to ingredients_path
  end
end
