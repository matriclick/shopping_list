class MenusController < ApplicationController
  # GET /menus
  # GET /menus.json
  def index
    @menus = Menu.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @menus }
    end
  end

  # GET /menus/1
  # GET /menus/1.json
  def show
    @menu = Menu.find(params[:id])
    
    if !current_user.admin?
      respond_to do |format|
        format.html { redirect_to show_menu_for_user_path }
        format.json { render json: @menu }
      end
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @menu }
      end
    end
  end

  # GET /menus/new
  # GET /menus/new.json
  def new
    @menu = Menu.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @menu }
    end
  end
  
  # GET /menus/new
  # GET /menus/new.json
  def new_user_menu
    @menu = Menu.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @menu }
    end
  end
  
  def create_menu_for_user
    @menu = Menu.new(params[:menu])
    @menu.user = @user
    @menu.assign_recipes_according_to_user
    
    respond_to do |format|
      if @menu.save
        format.html { redirect_to home_user_home_path, notice: 'Menu was successfully created.' }
        format.json { render json: @menu, status: :created, location: @menu }
      else
        format.html { render action: "new_user_menu" }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def show_shopping_list
    @user = current_user
    @shopping_list = @user.get_last_menu.shopping_list
  end

  def show_menu_for_user
    @user = current_user
    @menu = @user.get_last_menu
  end
  
  def send_shopping_list
    NoticeMailer.shopping_list_email(@user.get_last_menu).deliver
    redirect_to show_shopping_list_path
  end
  
  # GET /menus/1/edit
  def edit
    @menu = Menu.find(params[:id])
  end

  # POST /menus
  # POST /menus.json
  def create
    @menu = Menu.new(params[:menu])
    
    respond_to do |format|
      if @menu.save
        format.html { redirect_to @menu, notice: 'Menu was successfully created.' }
        format.json { render json: @menu, status: :created, location: @menu }
      else
        format.html { render action: "new" }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /menus/1
  # PUT /menus/1.json
  def update
    @menu = Menu.find(params[:id])

    respond_to do |format|
      if @menu.update_attributes(params[:menu])
        format.html { redirect_to @menu, notice: 'Menu was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menus/1
  # DELETE /menus/1.json
  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy

    respond_to do |format|
      format.html { redirect_to menus_url }
      format.json { head :no_content }
    end
  end
  
end
