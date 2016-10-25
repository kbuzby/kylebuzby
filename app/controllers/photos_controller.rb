class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      if params["save_and_add"]
        redirect_to new_photo_path
      elsif params["save_and_return"]
        redirect_to root
      end
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
  end

  def show
    @photo = Photo.find(params[:id])
  end

  private
    def photo_params
    params.require(:photo).permit(:name, :post_id, :category, :path)
  end

end
