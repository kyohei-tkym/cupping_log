class ApplicationController < ActionController::Base
  before_action :authenticate_user!,only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :introduction, :profile_image])
  end
end
