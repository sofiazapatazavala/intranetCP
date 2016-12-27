class WeddingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_wedding, only: [:show, :edit, :update, :destroy]

  # GET /weddings
  # GET /weddings.json
  def index
  #  @weddings = Wedding.all

  # Initialize filterrific with the following params:
  # * `Wedding` is the ActiveRecord based model class.
  # * `params[:filterrific]` are any params submitted via web request.
  #   If they are blank, filterrific will try params persisted in the session
  #   next. If those are blank, too, filterrific will use the model's default
  #   filter settings.
  # * Options:
  #     * select_options: You can store any options for `<select>` inputs in
  #       the filterrific form here. In this example, the `#options_for_...`
  #       methods return arrays that can be passed as options to `f.select`
  #       These methods are defined in the model.
  #     * persistence_id: optional, defaults to "<controller>#<action>" string
  #       to isolate session persistence of multiple filterrific instances.
  #       Override this to share session persisted filter params between
  #       multiple filterrific instances. Set to `false` to disable session
  #       persistence.
  #     * default_filter_params: optional, to override model defaults
  #     * available_filters: optional, to further restrict which filters are
  #       in this filterrific instance.
  # This method also persists the params in the session and handles resetting
  # the filterrific params.
  # In order for reset_filterrific to work, it's important that you add the
  # `or return` bit after the call to `initialize_filterrific`. Otherwise the
  # redirect will not work.
  @filterrific = initialize_filterrific(
    Wedding,
    params[:filterrific],
    select_options: { },
    persistence_id: '',
    default_filter_params: {},
    available_filters: [],
  ) or return
  # Get an ActiveRecord::Relation for all Weddings that match the filter settings.
  # You can paginate with will_paginate or kaminari.
  # NOTE: filterrific_find returns an ActiveRecord Relation that can be
  # chained with other scopes to further narrow down the scope of the list,
  # e.g., to apply permissions or to hard coded exclude certain types of records.
  @weddings = @filterrific.find.page(params[:page])

  # Respond to html for initial page load and to js for AJAX filter updates.
  respond_to do |format|
    format.html
    format.js
  end

  # Recover from invalid param sets, e.g., when a filter refers to the
  # database id of a record that doesn’t exist any more.
  # In this case we reset filterrific and discard all filter params.
  rescue ActiveRecord::RecordNotFound => e
  # There is an issue with the persisted param_set. Reset it.
    puts "Had to reset filterrific params: #{ e.message }"
    redirect_to(reset_filterrific_url(format: :html)) and return
  end

  # GET /weddings/1
  # GET /weddings/1.json
  def show
  # Cookies para construir la relación bloggable. Reemplazar id_blog y tipo_blog según corresponda.
    cookies[:id_blog] = @wedding.id
    cookies[:tipo_blog] = "Wedding"
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
      params.require(:wedding).permit(:created_at, :updated_at, :nombre1, :nombre2, :fecha_matri, :celular, :mail, :origen, :url_vals, :comentarios, :nombre_contacto, :telefono_novia, :telefono_novio, :email_novia, :email_novio, :tipo_descuento, :floordesign, :rut_novia, :rut_novio, :instagram_novia, :maspersonas)
    end
end
