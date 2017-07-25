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
    cookies[:uidfu] = { value: @user.id, expires: 10.minutes.from_now }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

end
