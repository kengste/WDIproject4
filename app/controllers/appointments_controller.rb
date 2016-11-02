class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  before_action :set_appointments, only: [:index, :show, :edit]
  before_action :set_client, only: [:index, :new, :edit]
  before_action :set_staff, only: [:index, :new, :edit]

  def index
    @upcoming_appointments = current_user.upcoming_appointments
  end

  def show
  end

  def new
    @appointments = current_user.appointments
    @appointment = current_user.appointments.build
  end

  def create
    @appointment = Appointment.new(appointment_params.merge(user_id: current_user.id))
    if @appointment.valid?
      @appointment.save
      redirect_to appointments_path
    else
      @appointment.user = nil
      @appointments = current_user.appointments.select { |a| a.persisted? }
      render :new
    end
  end

  def edit
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to appointments_path
    else
      set_appointments
      render :edit
    end
  end

  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_path }
      format.js   { render :layout => false }
    end

  end

  private

  def set_client
    @client = current_user.clients.find_by(id: params[:client_id])
  end

  def set_staff
    @staff = current_user.staffs.find_by(id: params[:staff_id])
  end

    def set_appointment
    @appointment = current_user.appointments.find_by(id: params[:id])
    if @appointment.nil?
      flash[:error] = "Appointment not found."
      redirect_to appointments_path
    end
  end

  def set_appointments
    @appointments = current_user.appointments.order(appointment_time: :desc)
  end

  def appointment_params
    params.require(:appointment).permit(:client_id, :staff_id, staff_attributes: [:first_name], client_attributes: [:name], appointment_time: [:date, :hour, :min], duration: [:hour, :min])
  end

end
