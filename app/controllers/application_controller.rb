class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == '2222'
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :name_first, :name_last, :name_first_reading, :name_last_reading, :birthday, :encrypted_password ])
  end
end
