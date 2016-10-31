class Client < ApplicationRecord
  belongs_to :user
  has_many :appointments, dependent: :destroy
  has_many :staffs, through: :appointments

  def appointment_count
    @appointment_count ||= appointments.count
  end

  ## Validations

  validates :name, presence: true
  validates :email, format: { with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i, message: 'Please enter a valid email address' }, allow_blank: true
  validates :phone_number, presence: true

  include ActiveModel::Validations

  class UserIdValidator < ActiveModel::Validator
    def validate(record)
      if User.find_by(id: record.user_id)
        record.errors.delete :user_id
      end
      if record.user_id && User.find_by(id: record.user_id).nil?
        record.errors[:user_id] << "User not found."
      end
    end
  end

  validates_with UserIdValidator

  ##


end
