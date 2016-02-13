Rails.application.routes.draw do
    root to: "welcome#index"
    mount ActionCable.server => "/cable"
    post "/welcome/create" => "welcome#create"
end
