class ChefProfilesController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]
  # GET /chef_profiles
  # GET /chef_profiles.json
  def index
    @chef_profiles = ChefProfile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @chef_profiles }
    end
  end

  # GET /chef_profiles/1
  # GET /chef_profiles/1.json
  def show
    @chef_profile = ChefProfile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @chef_profile }
    end
  end

  # GET /chef_profiles/new
  # GET /chef_profiles/new.json
  def new
    @chef_profile = ChefProfile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @chef_profile }
    end
  end

  # GET /chef_profiles/1/edit
  def edit
    @chef_profile = ChefProfile.find(params[:id])
    if @chef_profile.user_id != current_user.id
      redirect_to user_home_user_path
    end
  end

  # POST /chef_profiles
  # POST /chef_profiles.json
  def create
    @chef_profile = ChefProfile.new(params[:chef_profile])

    respond_to do |format|
      if @chef_profile.save
        format.html { redirect_to @chef_profile, notice: 'Chef profile was successfully created.' }
        format.json { render json: @chef_profile, status: :created, location: @chef_profile }
      else
        format.html { render action: "new" }
        format.json { render json: @chef_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /chef_profiles/1
  # PUT /chef_profiles/1.json
  def update
    @chef_profile = ChefProfile.find(params[:id])

    respond_to do |format|
      if @chef_profile.update_attributes(params[:chef_profile])
        format.html { redirect_to @chef_profile, notice: 'Chef profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @chef_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chef_profiles/1
  # DELETE /chef_profiles/1.json
  def destroy
    @chef_profile = ChefProfile.find(params[:id])
    @chef_profile.destroy

    respond_to do |format|
      format.html { redirect_to chef_profiles_url }
      format.json { head :no_content }
    end
  end
end
