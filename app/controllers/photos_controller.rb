class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def new
    if !admin?
      redirect_to photos_path
    end

    @photo = Photo.new
  end

  def create
    if !admin?
      redirect_to photos_path
    end

    @photo = Photo.new(photo_params)
    if @photo.save
      if params["save_and_add"]
        redirect_to new_photo_path
      elsif params["save_and_return"]
        redirect_to "/home"
      end
    end
  end

  def destroy
    if !admin?
      redirect_to photo_path(params[:id])
    end

    @photo = Photo.find(params[:id])
    @photo.delete
  end

  def show
    @photo = Photo.find(params[:id])
  end

  private
    def photo_params
    params.require(:photo).permit(:name, :post_id, :category, :path)
  end

end
