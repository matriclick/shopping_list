class RecipesController < ApplicationController
  autocomplete :ingredient, :name, :full => true
  before_filter :authenticate_user!, :except => [:search, :show]
  
  def remove_from_favorite
    @recipe = Recipe.find(params[:id])
    current_user.remove_recipe_from_favorites(@recipe)   
    redirect_to @recipe 
  end
  
  def add_to_favorite
    @recipe = Recipe.find(params[:id])
    current_user.add_recipe_to_favorites(@recipe)
    redirect_to @recipe
  end
  
  def search
    get_recipes_from_params(params)
  end
  
  def my_recipes
    get_recipes_from_params(params, current_user.id)
  end
  
  def add_recipe_to_shopping_list
    @recipe = Recipe.find(params[:id])
    @recipe.add_to_shopping_list(current_user.get_current_shopping_list)
    redirect_to home_shopping_list_path
  end
  
  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = Recipe.all
    @user = current_user
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @recipes }
    end
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
    @recipe = Recipe.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @recipe }
    end
  end

  # GET /recipes/new
  # GET /recipes/new.json
  def new
    @recipe = Recipe.new 
    @recipe.recipe_ingredients.build
    @recipe.recipe_images.build
    @recipe.recipe_steps.build
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @recipe }
    end
  end

  # GET /recipes/1/edit
  def edit
    @recipe = Recipe.find(params[:id])
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(params[:recipe])

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render json: @recipe, status: :created, location: @recipe }
      else
        format.html { render action: "new" }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /recipes/1
  # PUT /recipes/1.json
  def update
    @recipe = Recipe.find(params[:id])

    respond_to do |format|
      if @recipe.update_attributes(params[:recipe])
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to recipes_url }
      format.json { head :no_content }
    end
  end
  
  private
  
  def get_recipes_from_params(params, only_from_logged_user = false)
    @search_term = params[:q]
    
    unless params[:recipe].nil?
      @tag_names = params[:recipe][:tag_names] || Array.new
      @meal_names = params[:recipe][:meal_names] || Array.new
    end
  
    if !@search_term.nil?
      @recipes = Recipe.search(@search_term, only_from_logged_user)
    elsif !@tag_names.nil? or !@meal_names.nil?
      @recipes = Recipe.search_and(@tag_names, @meal_names, only_from_logged_user)
    else
      if only_from_logged_user
        @recipes = current_user.recipes
      else
        @recipes = Recipe.order('created_at DESC').limit 19
      end
      @search_term = ''
      @tag_names = Array.new
      @meal_names = Array.new
    end
  end

end
