class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  # Llama a todos los usuarios, sin riesgos
  def index
    @users = User.all
  end

  # Permite mostrar fichas de usuario
  # GET /users/1
  # GET /users/1.json
  def show
  end

  # Métodos para crear nuevos clientes (usuarios que no son admin) estando una con la sesión iniciada?
  # GET /nuevo_usuario
  def new_client
  end

  # POST /nuevo_usuario
  def create_client
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

end
