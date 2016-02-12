class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy, :add_restaurant_to_group]
  before_action :current_group, except: [:set_current_group]

  # GET /restaurants
  # GET /restaurants.json
  def index
    if session[:current_group].nil?
      redirect_to groups_path
    else
      @group = Group.find(session[:current_group]['id'])
      @restaurants = @group.restaurants
    end
  end

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
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

  ##############
  def spin
    restaurants = @current_group.restaurants
    r = Random.rand(restaurants.length - 1)
    restaurant = restaurants[r]
    redirect_to restaurant_path(restaurant), notice: "You selected #{restaurant}"
  end

  def search
  end

  def find
    @restaurants = []
    response = Restaurant.find_by_name(params[:name])
    response['results'].each do |resp|
      restaurant = Restaurant.where(place_id: resp['place_id']).first_or_create do |r|
        r.name = resp['name']
        r.latitude = resp['geometry']['location']['lat']
        r.longitude = resp['geometry']['location']['lng']
        r.reference = resp['reference']
        r.types = resp['types']
        r.vicinity = resp['vicinity']
        r.rating = resp['rating']
        r.price = resp['price_level']
        r.save!
      end
      @restaurants << restaurant
    end
    @restaurants
  end

  def popular
    @restaurants = []
    response = Restaurant.find_by_popularity(params[:latitude], params[:longitude])
    response['results'].each do |resp|
      restaurant = Restaurant.where(place_id: resp['place_id']).first_or_create do |r|
        r.name = resp['name']
        r.latitude = resp['geometry']['location']['lat']
        r.longitude = resp['geometry']['location']['lng']
        r.reference = resp['reference']
        r.types = resp['types']
        r.vicinity = resp['vicinity']
        r.rating = resp['rating']
        r.price = resp['price_level']
        r.save!
      end
      @restaurants << restaurant
    end
    render 'find'
  end

  def add_restaurant_to_group
    sr = SelectedRestaurant.new
    sr.group = Group.find(session[:current_group]['id'])
    sr.restaurant = @restaurant
    sr.save!

    redirect_to root_path
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_params
      params.require(:restaurant).permit(:name, :price, :distance, :rating)
    end

    def current_group
      @current_group = Group.find(session[:current_group]['id']) if session[:current_group]
    end
end
