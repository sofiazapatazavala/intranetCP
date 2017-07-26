class StudentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /students
  # GET /students.json
  def index
    @students = Student.all
  end

  def search
    @weddings = Wedding.buscar(params[:buscar]).page(params[:page])
  end

  # GET /students/1
  # GET /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new(nombre: cookies[:arch_nombre], email: cookies[:arch_email], telefono: cookies[:arch_tel])
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)
    @student.course_id = cookies[:id_curso]

    respond_to do |format|
      if @student.save
        cookies.delete(:arch_nombre)
        cookies.delete(:arch_email)
        cookies.delete(:arch_tel)
        format.html { redirect_to @student, notice: 'Se creó el registro de alumna satisfactoriamente.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Se actualizó el registro de alumna satisfactoriamente.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Se borró el registro de alumna satisfactoriamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:nombre, :telefono, :email, :email2, :comoseenteraron, :descuento, :comentarios, :pago, :comentarios_pago)
    end
end
