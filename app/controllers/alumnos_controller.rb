class AlumnosController < ApplicationController
  respond_to :json
  skip_before_action :verify_authenticity_token, only: [:create, :update]

  def index
    render json: Alumno.all
  end

  def show
    render json: Alumno.find(params[:id])
  end

  def create
    alumno = Alumno.create!(safe_params)
    render json: alumno
  end

  def update
    alumno = Alumno.find(params[:id])
    alumno.update_attributes(safe_params)
    head :ok
  end

  private

  def safe_params
    params.require(:alumno).permit(:nombre, :primer_apellido, :segundo_apellido)
  end
end
