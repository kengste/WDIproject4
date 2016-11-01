class SchedulesController < ApplicationController
  before_action :authenticate_staff!
  # before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  before_action :set_appointments, only: [:index]
  before_action :set_client, only: [:index]

  def index
    @upcoming_schedules = current_staff.appointments.order(appointment_time: :asc).select { |a| a.appointment_time > (DateTime.now) }
  end

  private

  def set_client
    @client = current_staff.clients.find_by(id: params[:client_id])
  end

  def set_appointments
    @appointments = current_staff.appointments.order(appointment_time: :desc)
  end


end
