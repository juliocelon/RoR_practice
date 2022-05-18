class PhotosController < ApplicationController

  def index
    @all = Photo.all
  end

  def show
    @my_photo = Photo.find(params[:id])
  end

  def new
  end

  def create
    photo = Photo.new
    photo.title = params[:photo][:title]
    photo.image_url = params[:photo][:image_url]
    photo.save

    # redirect_to "/photos/#{photo.id}"
    redirect_to photo
  end

end
