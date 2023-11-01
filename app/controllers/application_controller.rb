class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authenticate_user!, except: [:index]
    add_flash_types :success, :info, :warning, :danger
    
    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
        devise_parameter_sanitizer.permit(:sign_in, keys: [:user_name])
        devise_parameter_sanitizer.permit(:edit, keys: [:user_name])
    end

    def after_sign_out_path_for(resource_or_scope)
        root_path
    end
end
