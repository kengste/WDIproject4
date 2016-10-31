class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :clients
  has_many :appointments

  def upcoming_appointments
    appointments.order(appointment_time: :desc).select { |a| a.appointment_time > (DateTime.now) }
  end
end
