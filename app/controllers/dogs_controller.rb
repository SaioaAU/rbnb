class DogsController < ApplicationController
  before_action :find_dog, only: [:show, :edit, :update, :destroy]


  def index
    if params[:query].present?
      @dogs = Dog.where("address ILIKE ?", "%#{params[:query]}%")
    else
      @dogs = Dog.all
    end
    # result = Geocoder.search("34 schweigaards gate")
    #@dogs2 = Dog.geocoded #returns dogs with coordinates
    @markers = @dogs.map do |dog|
      {
        lat: dog.latitude,
        lng: dog.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { dog: dog }),
        image_url: helpers.asset_url('dog-icon.png')
      }
    end
  end

  def show
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.owner = current_user
    if @dog.save
      redirect_to dog_path(@dog)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @dog.update(dog_params)
      redirect_to dog_path(@dog)
    else
      redirect_to edit_dog_path
    end
  end

  def destroy
    @dog.destroy
    redirect_to root_path
  end

  private

  def find_dog
    @dog = Dog.find(params[:id])
  end

  def dog_params
    params.require(:dog).permit(:query, :name, :age, :race, :bio, :address, :available_start_date, :available_end_date, photos: [])
  end

end
