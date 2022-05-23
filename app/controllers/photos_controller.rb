class PhotosController < ApplicationController
  include Geolocalizable
  skip_before_action :verify_authenticity_token
  before_action :set_photo , only: [:show, :update, :destroy]

  def test
    # render "test1"
    # render "/test2"
    render "/users/test3"
  end
  
  def index
    puts params[:name]
    @all = Photo.all
  end

  def show
    # Assigned on before_action :set_photo: 
    # @photo = Photo.find(params[:id]) 

    respond_to do | format |
      format.html { render :show }
      format.json { render json: @photo }
    end

  end

  def new
    session[:attempts] = session[:attempts] ? session[:attempts] +1 : 1
    # session[:attempts] = session[:attempts] + 1
  end

  def create
    # photo = Photo.new
    # photo.title = params[:photo][:title]
    # photo.image_url = params[:photo][:image_url]
    # photo.save

    # redirect_to "/photos/#{photo.id}"
    # redirect_to photo

    # respond_to do | format |
    #   format.html { redirect_to "/photos"}
    #   format.json { render json: photo }
    # end

    @photo = Photo.new(photo_filtered_params)

    respond_to do | format |
      if @photo.save
        format.html { redirect_to @photo}
        format.json { render json: @photo }
      else
        format.html { 
          redirect_back fallback_location: photos_path,  
          notice: "Error : #{@photo.errors.full_messages.to_sentence}"}
      end
    end

  end

  def edit
    @id = params[:id]
  end

  def update
    # photo = Photo.find(params[:id])
    # photo.title = params[:photo][:title]
    # photo.image_url = params[:photo][:image_url]
    # photo.save

    # Assigned on before_action :set_photo :
    # @photo = Photo.find(params[:id]) 

    @photo.update(photo_filtered_params)

    redirect_to @photo
  end

  def destroy
    # Assigned on before_action :set_photo: 
    # @photo = Photo.find(params[:id])

    @photo.destroy
    
    puts "DESTRUIIII"*200

    puts "REDIRECT TO:"
    puts photos_path
    # byebug
    redirect_to photos_url
    # respond_to do | format |
    #   format.html { redirect_to photos_path }
    #   # format.json { head 200 }
    #   # format.json { head :ok }
    #   # format.json { head :no_content }
    # end
  end

  private

  def photo_filtered_params
    params.require(:photo).permit(:title, :image_url)
  end

  def set_photo
    @photo = Photo.find(params[:id])
  end

end
