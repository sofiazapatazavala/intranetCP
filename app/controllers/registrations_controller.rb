class RegistrationsController < Devise::RegistrationsController
  http_basic_authenticate_with name: ENV['REGISTER_USER'], password: ENV['REGISTER_PASS'], only: :new
end
