require_relative '../services/google_maps_service'


class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  #retrieves all properties
  def index
    @properties = Property.all

    if @properties
        render json: {status: "SUCCESS", message: "Fetched all the properties successfully", data: @properties}, status: 200
      else
        render json: @properties.errors, status: :bad_request
      end
  end

  #retrieves  properties by owner name
  def properties_by_owner
    @properties = Property.where('lower(property_owner) = ?', params[:owner].downcase)
    render json: @properties
  end

  #retrieves properties by number of bedrooms
  def filter_by_bedrooms
    @properties = Property.where(bedrooms: params[:bedrooms])
    render json: @properties
  end

  #retrieves properties by number bathrooms
  def filter_by_bathrooms
    @properties = Property.where(bathrooms: params[:bathrooms])
    render json: @properties
  end

  #retrieves property by address
  def filter_by_address
    @properties = Property.where("LOWER(address) LIKE ?", "%#{params[:address].downcase}%")
    render json: @properties
  end

  #show property by id
  def show
    render json: @property
  end

  def new
    @property = Property.new
  end

  #creates a new property and adds to db
  def create
    @property = Property.new(property_params)
    @address = property_params[:address]
    puts "address:  " +  @address 

    # @is_valid = validate_address(@address)
    # puts " checking validation " + @is_valid 

    if validate(@address)
      if @property.valid?
        @property.save
        render json: {status: "SUCCESS", message: "property created successfully", data: @property}
      else
        render json: { errors: property.errors.full_messages }, status: :unprocessable_entity
      end
    else
      # puts "address not valid  "
      flash[:error] = 'Address validation failed. Please try again.'
      redirect_to new_address_path
    end

  end

  def edit
  end

  #update a property
  def update_properties
    @property = Property.find(params[:id])
    if @property.valid?
      @property.update(property_update_params)
      render json: { message: 'Property updated successfully' }
    else
      render json: { error: @property.errors.full_messages.join(', ') }, status: :unprocessable_entity
    end
  end

  #deletes a property
  def destroy
    @property.destroy
    redirect_to properties_url, notice: 'Property was successfully destroyed.'
  end

  #validates address 
  def validate(address)
    validated_address = GoogleMapsServiceClass.validate_address(address)

    if validated_address
      return true
    else
      return false
    end
  end

  private

  #sets the property to be found by the find method
  def set_property
    @property = Property.find(params[:id])
  end

  #defines the structure of the property to be created by the create method
  def property_params
    params.require(:property).permit(:address, :property_type, :bedrooms, :sitting_rooms, :kitchens, :bathrooms, :toilets, :property_owner, :description, :valid_from, :valid_to)
  end

  def property_update_params
    params.require(:property).permit(:description, :bedrooms, :sitting_rooms, :kitchens, :bathrooms, :toilets, :valid_to)
  end

end
