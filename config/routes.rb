Rails.application.routes.draw do
    root to: "welcome#index"
    mount ActionCable.server => "/cable"
    post "/upload/create" => "upload#create"
end
