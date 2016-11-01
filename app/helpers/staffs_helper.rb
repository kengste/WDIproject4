module StaffsHelper
  def staff_email(staff)
    staff.email if staff.email != ""
  end

  def staff_name(staff)
    if current_page?(staffs_path)
      link_to staff.first_name, staff_path(staff)
    else
      staff.first_name
    end
  end

  def appointment_count(staff)
    link_to "Total Appointments: #{staff.appointment_count}", staff_path(staff)
  end

end