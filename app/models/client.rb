class Client < ApplicationRecord
  belongs_to :user
  has_many :appointments, dependent: :destroy
  has_many :staffs, through: :appointments
  
  def appointment_count
    @appointment_count ||= appointments.count
  end

end
