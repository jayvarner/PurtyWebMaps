class RasterProcessesController < ApplicationController
    def index
        if cookies[:user_id].nil? or cookies[:user_id] == 0
            cookies.signed[:user_id] = {:value => SecureRandom.uuid, :expires => 48.hours.from_now }
        end
    end
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
        ProcessSession.upload_start(params[:session][:uuid], params[:upload][:file].original_filename)
        redirect_to action: :index
    end
end
