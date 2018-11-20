class DoctorsController < ApplicationController

  before_action :set_doctor, only: [:show, :destroy] 

  def index
    @doctors = Doctor.all
  end

  def show
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.create(doctor_params)

    if @doctor.save
      redirect_to @doctor
    else
      render :new
  end
end

private
def destroy
  @doctor.destroy
  redirect_to doctors_path
end

def doctor_params
  params.require(:doctor).permit(:name)
end
end
