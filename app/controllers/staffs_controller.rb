class StaffsController < ApplicationController
  before_action :set_staff, only: [:show]
  def index
    @staffs = []
    @staffs = Staff.all
  end

  def show
    @appointments = @staff.appointments
  end

  private

  def set_staff
    @staff = Staff.all.find_by(id: params[:id])
    if @staff.nil?
      flash[:error] = "Staff not found."
      redirect_to staffs_path
    end
  end

end
