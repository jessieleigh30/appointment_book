class AppointmentsController < ApplicationController

  before_action :set_doctor

  def index
    @appointments = @doctor.appointments
  end

  def new
    @appointment = @doctor.appointments.new
  end

  def create
    @appointments = @doctor.appointments.new(appointment_params)
    if @appointment.save
      redirect_to doctor_appointments_path
    else
      render :new
    end
  end

  def destroy
    appointment = @doctor.appointments.find(params[:id])
    appointment.destroy
    redirect_to doctor_patients_path
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:enrollment).permit(:date, :time)
  end
end

