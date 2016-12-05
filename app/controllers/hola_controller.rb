class HolaController < ApplicationController
  before_action :authenticate_user!, only: :portada

  def portada
    @meetings = Lesson.all
  end

  def index
  end
end
