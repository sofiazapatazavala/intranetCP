class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  require 'csv'
# Configuración para que Devise acepte más parámetros
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to main_app.root_url, notice: exception.message }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end

  protected
# No pasamos :admin por ahora, dado que se cambiará por consola solamente.
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :remember_me, :name])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password, :remember_me])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :remember_me, :admin, :name])
  end
end
