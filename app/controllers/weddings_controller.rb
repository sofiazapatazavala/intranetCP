class WeddingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_wedding, only: [:show, :edit, :update, :destroy]

  # GET /weddings
  # GET /weddings.json
  def index
    @weddings = Wedding.all
  end

  def search
    @weddings = Wedding.buscar(params[:buscar]).page(params[:page])
  end

  # GET /weddings/1
  # GET /weddings/1.json
  def show
  # Cookies para construir la relación bloggable y el llenado de archivos.
    cookies[:id_blog] = @wedding.id
    cookies[:tipo_blog] = "Wedding"
    cookies[:arch_nombre] = @wedding.nombre1
    cookies[:arch_email] = @wedding.email_novia
    cookies[:arch_tel] = @wedding.telefono_novia
    cookies[:@rch_proc] = "Matrimonio"
  end

  # GET /weddings/new
  def new
    @wedding = Wedding.new
  end

  # GET /weddings/1/edit
  def edit
  end

  # POST /weddings
  # POST /weddings.json
  def create
    @wedding = Wedding.new(wedding_params)

    respond_to do |format|
      if @wedding.save
        format.html { redirect_to @wedding, notice: 'Wedding was successfully created.' }
        format.json { render :show, status: :created, location: @wedding }
      else
        format.html { render :new }
        format.json { render json: @wedding.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weddings/1
  # PATCH/PUT /weddings/1.json
  def update
    respond_to do |format|
      if @wedding.update(wedding_params)
        format.html { redirect_to @wedding, notice: 'Wedding was successfully updated.' }
        format.json { render :show, status: :ok, location: @wedding }
      else
        format.html { render :edit }
        format.json { render json: @wedding.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weddings/1
  # DELETE /weddings/1.json
  def destroy
    @wedding.destroy
    respond_to do |format|
      format.html { redirect_to weddings_url, notice: 'Wedding was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wedding
      @wedding = Wedding.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wedding_params
      params.require(:wedding).permit(:nombre1, :nombre2, :fecha_matri, :origen, :url_vals, :comentarios, :telefono_novia, :telefono_novio, :email_novia, :email_novio, :tipo_descuento, :floordesign, :rut_novia, :rut_novio, :instagram_novia, :maspersonas, :contacto, :comentarios_pago, :song, :avatar)
    end
end
