class Staff < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :user
  has_many :appointments, dependent: :destroy
  has_many :clients, through: :appointments

  def appointment_count
    @appointment_count ||= appointments.count
  end

  validates :first_name, presence: true
end
