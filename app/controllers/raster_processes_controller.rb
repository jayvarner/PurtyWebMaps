class RasterProcessesController < ApplicationController
    def create
        # name = params[:upload][:file].original_filename
        # directory = "public/uploads"
        # path = File.join(directory, name)
        uploader = FileUpload.create
        uploader.uuid = params[:session][:uuid]
        uploader.uploaded_file = params[:upload][:file]
        uploader.save
        # uploader.store!(
        #     File.open(path)
        # )
        redirect_to action: :index
    end
end
