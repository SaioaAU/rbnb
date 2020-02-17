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

  # def create
  #   @dog = Dog.new(params_dog)
  #   @user = current_user
  #   @dog.user = @user
  #   @dog.save
  #   redirect_to dog_path(@dog)
  # end

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
    params.require(:dog).permit(:name, :age, :race, :bio, :photo)
  end

end
