class ArchivesController < ApplicationController
  before_action :set_archive, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /archives
  # GET /archives.json
  def index
    @archives = Archive.all
    respond_to do |format|
      format.html
      format.csv do
        headers['Content-Disposition'] = "attachment; filename=\"datos-plataforma-CP.csv\""
        headers['Content-Type'] ||= 'text/csv'
      end
    end
  end

  def search
    @archives = Archive.buscar(params[:buscar]).page(params[:page])
  end

  # GET /archives/1
  # GET /archives/1.json
  def show
    cookies[:arch_nombre] = { value: @archive.nombre, expires: 10.minutes.from_now }
    cookies[:arch_email] = { value: @archive.email, expires: 10.minutes.from_now }
    cookies[:arch_tel] = { value: @archive.telefono, expires: 10.minutes.from_now }
  end

  # GET /archives/new
  def new
    @archive = Archive.new
  end

  # GET /archives/1/edit
  def edit
  end

  # POST /archives
  # POST /archives.json
  def create
    @archive = Archive.new(archive_params)

    respond_to do |format|
      if @archive.save
        cookies.delete(:arch_nombre)
        cookies.delete(:arch_email)
        cookies.delete(:arch_tel)
        format.html { redirect_to @archive, notice: 'Se creó el registro satisfactoriamente.' }
        format.json { render :show, status: :created, location: @archive }
      else
        format.html { render :new }
        format.json { render json: @archive.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /archives/1
  # PATCH/PUT /archives/1.json
  def update
    respond_to do |format|
      if @archive.update(archive_params)
        format.html { redirect_to @archive, notice: 'Se actualizó el registro satisfactoriamente.' }
        format.json { render :show, status: :ok, location: @archive }
      else
        format.html { render :edit }
        format.json { render json: @archive.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /archives/1
  # DELETE /archives/1.json
  def destroy
    @archive.destroy
    respond_to do |format|
      format.html { redirect_to archives_url, notice: 'Se borró el registro satisfactoriamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_archive
      @archive = Archive.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def archive_params
      params.require(:archive).permit(:nombre, :email, :telefono, :procedencia, :comentarios)
    end
end
