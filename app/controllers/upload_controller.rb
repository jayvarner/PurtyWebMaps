class UploadController < ApplicationController
    def create
        name = params[:upload][:file].original_filename
        directory = "public/uploads"
        path = File.join(directory, name)
        File.open(path, "wb") { |f| f.write(params[:upload][:file].read) }
        flash[:notice] = "File uploaded"
        redirect_to "/"
    end
end
