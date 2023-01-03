class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
    # def configure_permitted_parameters
    #     devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:firstname,:lastname, :email, :password) }
    #     devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:firstname,:lastname, :email, :password, :current_password) }
    # end
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname, :email, :password])
        devise_parameter_sanitizer.permit(:account_update, keys: [:firstname, :lastname, :email, :password, :password_confirmation, :current_password])
        
    end
end
