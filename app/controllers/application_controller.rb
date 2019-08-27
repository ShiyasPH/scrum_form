class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
        stored_location_for(resource) || scrum_path
    end
    protect_from_forgery with: :exception
    add_flash_types :success, :danger, :info
end
