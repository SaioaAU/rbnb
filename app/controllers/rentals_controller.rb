class RentalsController < ApplicationController
  def new
    @dog = Dog.find(params[:dog_id])
    @rental = Rental.new
    @user = User.all.find { |user| user  == current_user }
  end

  def create
    @rental = Rental.new(rental_params)
    @user = User.where(name: params[:rental][:user])
    @dog = Dog.find(params[:dog_id])
    @rental.dog = @dog
    @rental.user = current_user
    if @rental.save
      redirect_to rentals_path
    else
      render :new
    end
  end

  def index
    @myDogsConfirmedRentals = []
    @myDogsNotConfirmedRentals = []
    current_user.dogs.each do |dog|
      dog.rentals.each do |rental|
        if rental.confirmed
          @myDogsConfirmedRentals << rental
        else
          @myDogsNotConfirmedRentals << rental
        end
      end
    end

    @myConfirmedRentals = []
    @myPendingRentals = []
    current_user.rentals.each do |rental|
      if rental.confirmed
        @myConfirmedRentals << rental
      else
        @myPendingRentals << rental
      end
    end
  end

  def show
    @rental = Rental.find(params[:id])
  end

  def confirm
    @rental = Rental.find(params[:id])
    @rental.confirmed = true
    @rental.save
    redirect_to rentals_path
  end

  private

  def rental_params
    params.require(:rental).permit(:rented_start_date, :rented_nd_date)
  end
end
