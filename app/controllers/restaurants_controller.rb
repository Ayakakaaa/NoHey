class RestaurantsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  before_action :authorize!, only: [:create, :edit,:update, :destroy]


  # GET /restaurants
  # GET /restaurants.json
  def index
    # @restaurants = Restaurant.all
    if params[:tag]
        @tag = Tag.find_or_initialize_by(name: params[:tag])
        @restaurants = @tag.Restaurants.order(created_at: :desc)
    else
        @restaurants = Restaurant.order(created_at: :desc)
    end
    respond_to do |format|
        format.html { render :index }
        format.json { render json: @restaurants }
        # format.csv { render plain: 'blah, blah, blah'}
    end
  end

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
    if user_signed_in?
      @likers = @restaurant.likers.where.not(id: current_user.id)
      @user_restaurant = @restaurant.user_restaurants.find_by(user: current_user)
    end
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # GET /restaurants/1/edit
  def edit
  end

  # POST /restaurants
  # POST /restaurants.json
  def create
    @restaurant = Restaurant.new(restaurant_params)

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully created.' }
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurants/1
  # PATCH/PUT /restaurants/1.json
  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  def destroy
    @restaurant.destroy
      respond_to do |format|
        format.html { redirect_to restaurants_url, notice: 'Restaurant was successfully destroyed.' }
        format.json { head :no_content }
      end
  end

  def tag_names=(rhs) 
    self.tags = rhs.strip.split(/\s*,\s*/).map do |tag_name|
      # Finds the first record with the given attributes, OR 
      # initializes a record (Tag.new) with the given attributes 
      # if one is not found. 
      Tag.find_or_initialize_by(name: tag_name)
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_params
        params.require(:restaurant).permit(:name, :country, :state, :city, :zip_code, :address, :phone_number, :website, images:[])
    end

    def authorize! 
      unless can?(:crud, @restaurant)
          redirect_to root_path, alert: 'Not Authorized' 
      end
    end
end
