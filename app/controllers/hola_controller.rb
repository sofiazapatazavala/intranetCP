class HolaController < ApplicationController
  before_action :authenticate_user!, only: :portada

  def portada
    @meetings = Lesson.all
    @hola = PgSearch.multisearch( params[:q] ).paginate( :page => params[:page] )
  end

  def index
  end
end
