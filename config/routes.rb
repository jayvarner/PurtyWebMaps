Rails.application.routes.draw do
    resource :raster_processes
    root to: "raster_processes#index"
    # mount ActionCable.server => "/cable"
    post "/raster_processes/create" => "raster_processes#create"
end
