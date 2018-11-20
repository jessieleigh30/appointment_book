class AppointmentsController < ApplicationController

  before_action :set_doctor

  def index
    @date = @doctor.appointments
  end

  def new
  end
end
