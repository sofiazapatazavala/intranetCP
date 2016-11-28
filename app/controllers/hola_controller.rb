class HolaController < ApplicationController
  before_action :authenticate_user!, only: :portada

  def portada
  end

  def index
  end
end
