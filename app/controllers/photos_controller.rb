class PhotosController < ApplicationController
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
    @photo.save

    respond_to do | format |
      format.html { redirect_to @photo}
      format.json { render json: @photo }
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
    
    respond_to do | format |
      format.html { redirect_to "/photos"}
      format.json { head 200 }
      # format.json { head :ok }
      # format.json { head :no_content }
    end
  end

  private

  def photo_filtered_params
    params.require(:photo).permit(:title, :image_url)
  end

  def set_photo
    @photo = Photo.find(params[:id])
  end

end
