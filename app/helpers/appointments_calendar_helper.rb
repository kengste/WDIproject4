module AppointmentsCalendarHelper
  def add_monthly_calendar(appointments)
    render partial: "monthly_calendar_appointments", locals: { appointments: @appointments }
  end

  def appointment_position(appointment)
    "top: 10px;"
  end

  def appointment_height(appointment)
    "height: 40px;"
  end

  def highlight_appointment(appointment)
    if current_page?( appointment_path(appointment)) || current_page?( edit_appointment_path(appointment) )
      " highlight"
    end
  end

  def appointment_text(appointment)
    "<span class='name'>#{appointment.staff_name} - #{appointment.client_name}</span>".html_safe
  end

  def from_to(appointment)
    "#{appointment.start_time.strftime("%l:%M %p")} - #{appointment.end_time.strftime("%l:%M %p")}"
  end

  def date_of_next(day, start_date)
    date = Date.parse(day)
    delta = date >= start_date ? 0 : 7
    date + delta
  end

  def date_of_last(day)
    date_of_next(day) - 7.days
  end
end
