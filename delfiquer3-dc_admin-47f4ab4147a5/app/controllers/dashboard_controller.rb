class DashboardController < ApplicationController
  layout 'dashboard/application'
  before_filter :authenticate_user!

  before_action :set_patient, only: [:show]

  helper_method :patient, :collection

  # Muestra el dashboard principal y carga el primer paciente
  #
  # @return [View] La vista de index del dashboard con pacientes cargados
  def index
    @patient = collection.first
  end

  # Muestra el paciente cargado con los modulos de EKG para leer
  # el streaming que nos entrega el PCDuino
  #
  # @return [View] La vista de el paciente
  def show
  end

  private

  attr_reader :patient

  # Regresa los pacientes asignados al usuario
  #
  # @return [Array] Regresa un arreglo de pacientes
  def collection
    current_user.patients
  end

  # Obtiene el ID del paciente y hace carga el paciente en una variable
  #
  # @return [Array] Regresa un arreglo de pacientes
  def set_patient
    @patient = current_user.patients.find(params[:id])
  end
end
