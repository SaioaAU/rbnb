class RentalsController < ApplicationController
  def new
    @dog = Dog.find(params[:dog_id])
    @rental = Rental.new
    @user = User.all.find { |user| user.id  == current_user.id }
  end

  def create
    @rental = Rental.new(rental_params)
    @user = User.where(name: params[:rental][:user])
    @dog = Dog.find(params[:dog_id])
    @rental.dog_id = @dog[:id]
    @rental.user_id = current_user.id
    @rental.save
    redirect_to dog_path(@dog)
  end

  def index
    @rentals = Rental.all
  end

  def show
    @rental = Rental.find(params[:id])
  end

  private

  def rental_params
    params.require(:rental).permit(:rented_start_date, :rented_nd_date)
  end
end
