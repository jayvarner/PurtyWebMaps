class RasterProcessesController < ApplicationController
    def index
        if cookies[:user_id].nil? or cookies[:user_id] == 0
            cookies.signed[:user_id] = {:value => SecureRandom.uuid, :expires => 48.hours.from_now }
        end
    end
    def create
        uploader = FileUpload.create
        uploader.uuid = params[:session][:uuid]
        uploader.uploaded_file = params[:upload][:file]
        uploader.save

        uploader = RasterUploader.new
        # uploader.store(params[:upload][:file])

        redirect_to action: :index
    end

end
