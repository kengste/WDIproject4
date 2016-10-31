class AddRefsToAppointments < ActiveRecord::Migration[5.0]
  def change
    add_reference :appointments, :staff, foreign_key: true
  end
end
