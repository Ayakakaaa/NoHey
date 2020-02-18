class UserRestaurantsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_restaurant, only: [:create]
    before_action :find_user_restaurant, only: [:destroy]

    def create
        user_restaurant = UserRestaurant.new 
        user_restaurant.user = current_user
        user_restaurant.restaurant = @restaurant
        if user_restaurant.save
            flash[:success] = "Restaurant Liked!"
        else 
            flash[:danger] = user_restaurant.errors.full_messages.join(", ")
        end 
        redirect_to @restaurant     
    end

    def destroy
        if @user_restaurant.destroy
            flash[:success] = 'Restaurant Unliked'
        else
            flash[:danger] = "Can't Restaurant Unliked"
        end
        redirect_to @user_restaurant.restaurant
    end

    private

    def find_restaurant
        @restaurant = Restaurant.find params[:restaurant_id]
    end

    def find_user_restaurant
        @user_restaurant = UserRestaurant.find_by(id: params[:id])
        if !@user_restaurant
            redirect_to root_path
        end
    end
end
