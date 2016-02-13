class WelcomeController < ApplicationController
    def create
        # name = params[:upload][:file].original_filename
        uuid = params[:session][:uuid]
        # directory = "public/uploads"
        # path = File.join(directory, name)
        uploader = FileUpload.new
        uploader.uuid = uuid
        uploader.uploaded_file = params[:upload][:file]
        uploader.save
        # uploader.store!(
        #     File.open(path)
        # )
        redirect_to action: :index
    end
end
