class PhotosController < ApplicationController
    def destroy
        @photo = Photo.find(params[:id])
        engine = @photo.engine
        @photo.destroy
        @photos = Photo.where(engine_id: engine.id)
        respond_to :js
    end
end