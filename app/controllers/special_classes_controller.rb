class SpecialClassesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_special_class, only: [:show, :edit, :update, :destroy]

  # GET /special_classes
  # GET /special_classes.json
  def index
    @special_classes = SpecialClass.all
  end

  def search
    @special_classes = SpecialClass.buscar(params[:buscar]).page(params[:page])
  end
  # GET /special_classes/1
  # GET /special_classes/1.json
  def show
  # Cookies para construir la relación bloggable. Reemplazar id_blog y tipo_blog según corresponda.
    cookies[:id_blog] = @special_class.id
    cookies[:tipo_blog] = "SpecialClass"
    cookies[:arch_nombre] = @special_class.nombre
    cookies[:arch_email] = @special_class.email
    cookies[:arch_tel] = @special_class.telefono
    cookies[:arch_proc] = "Clase particular"
  end

  # GET /special_classes/new
  def new
    @special_class = SpecialClass.new
  end

  # GET /special_classes/1/edit
  def edit
  end

  # POST /special_classes
  # POST /special_classes.json
  def create
    @special_class = SpecialClass.new(special_class_params)

    respond_to do |format|
      if @special_class.save
        format.html { redirect_to @special_class, notice: 'Special class was successfully created.' }
        format.json { render :show, status: :created, location: @special_class }
      else
        format.html { render :new }
        format.json { render json: @special_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /special_classes/1
  # PATCH/PUT /special_classes/1.json
  def update
    respond_to do |format|
      if @special_class.update(special_class_params)
        format.html { redirect_to @special_class, notice: 'Special class was successfully updated.' }
        format.json { render :show, status: :ok, location: @special_class }
      else
        format.html { render :edit }
        format.json { render json: @special_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /special_classes/1
  # DELETE /special_classes/1.json
  def destroy
    @special_class.destroy
    respond_to do |format|
      format.html { redirect_to special_classes_url, notice: 'Special class was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_special_class
      @special_class = SpecialClass.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def special_class_params
      params.require(:special_class).permit(:nombre1, :nombre2, :nombre3, :nombre4, :nombre5, :nombre6, :contacto, :email, :telefono, :comoseenteraron, :descuento, :comentarios)
    end
end
