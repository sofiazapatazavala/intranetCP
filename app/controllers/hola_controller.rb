class HolaController < ApplicationController
  before_action :authenticate_user!, only: :portada

  def portada
    @meetings = Lesson.all
  # Si usamos multisearch, se activará esto
  # @hola = PgSearch.multisearch( params[:q] ).paginate( :page => params[:page] )
    @matrimonios = Wedding.count
    @clasesparticulares = SpecialClass.count
    @cursos = Course.count
    @alumnas = Student.count
    @clases = Lesson.count
  end

  def index
  end
end
