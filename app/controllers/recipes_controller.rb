class RecipesController < ApplicationController
  autocomplete :ingredient, :name, :full => true
  before_filter :authenticate_user!
  
  def search
    @search_term = params[:q]
    
    unless params[:recipe].nil?
      @tag_names = params[:recipe][:tag_names] || Array.new
      @meal_names = params[:recipe][:meal_names] || Array.new
      @ingredient_names = params[:recipe][:ingredient_names] || Array.new
    else
      @tag_names = Array.new
      @meal_names = Array.new
      @ingredient_names = Array.new
    end
  
    if !@search_term.nil?
      @recipes = Recipe.search(@search_term)
    elsif !@tag_names.nil? or !@meal_names.nil? or !@ingredient_names.nil?
      @recipes = Recipe.search_and(@tag_names, @meal_names, @ingredient_names)
    else
      @recipes = Recipe.all.order('created_at DESC').limit 19
      @search_term = ''
    end
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
end
