class DogsController < ApplicationController
  before_action :find_dog, only: [:show, :edit, :destroy, :update]


  def index
    @dogs = Dog.all
  end

  def show
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(params_dog)
    @dog.owner = current_user
    if @dog.save
      redirect_to dog_path(@dog)
    else
      redirect_to new_dog_path
    end
  end

  def edit
  end

  def update
    @dog = Dog.update(params_dog)
    redirect_to @dog
  end

  def destroy
    @dog.destroy
    redirect_to @dogs
  end

  private

  def find_dog
    @dog = Dog.find(params[:id])
  end

  def params_dog
    params.require(:dog).permit(:name, :age, :race, :bio, :photo, :owner, :available_start_date, :available_end_date)
  end

end
