class AppointmentsController < ApplicationController

  before_action :set_doctor
  before_action :set_patient, only: [:new, :create]

  def index
    @appointments = @doctor.appointments.order(:date, :time)
  end

  def new
    @patients = Patient.all
    @appointment = @doctor.appointments.new
  end


  def create
    @appointment = @doctor.appointments.new(appointment_params)
    if @appointment.save
      redirect_to doctor_appointments_path(@doctor)
    else
      render :new
    end
  end

  def destroy
    @doctor.appointments.find(params[:id]).destroy
    redirect_to doctor_appointments_path (@doctor)
  end
    

  private

  def set_doctor
    @doctor = Doctor.find(params[:doctor_id])
  end

  def appointment_params
    params.require(:appointment).permit(:date, :time, :patient_id)
  end

  def set_patient
    @patient = Patient.all - @doctor.patients
  end
 
end

