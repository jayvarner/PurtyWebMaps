class WelcomeController < ApplicationController
    def create
        name = params[:upload][:file].original_filename
        uuid = params[:session][:uuid]
        directory = "public/uploads"
        path = File.join(directory, name)
        File.open(path, "wb") { |f| f.write(params[:upload][:file].read) }
        puts "\n\n\n\nfrom controller #{uuid}\n\n\n\n"
        redirect_to action: :index
        ProcessSession.upload_start(uuid)
    end
end
