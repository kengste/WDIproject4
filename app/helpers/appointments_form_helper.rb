module AppointmentsFormHelper
  def client_fields(form, appointment, client)
    if client
      output = [content_tag(:b, "Client: #{client.name}"), content_tag(:p, ""), hidden_field_tag("appointment[client_id]", client.id)]
      safe_join(output)
    else
      render partial: "client_fields", locals: { f: form, appointment: appointment }
    end
  end

  def staff_fields(form, appointment, staff)
    if staff
      output = [content_tag(:h3, "at #{staff.first_name}"), hidden_field_tag("appointment[staff_id]", staff.id)]
      safe_join(output)
    else
      render partial: "staff_fields", locals: { f: form, appointment: appointment }
    end
  end

  def appointment_date(appointment)
    if appointment.appointment_time
      appointment.appointment_time.strftime("%m/%d/%Y")
    else
      Time.zone.now.strftime("%m/%d/%Y")
    end
  end

  def hour_selector(name, appointment)
    time_choices = {
     "8 AM" => 8
    }
    hidden_field_tag(name, options_for_select(time_choices, time_choices[appointment_hour(appointment)] ) )
  end

  def appointment_hour(appointment)
    if appointment.appointment_time
      appointment.appointment_time.strftime('%l %p').strip
    else
      "8 AM"
    end
  end

  def min_selector(name, appointment)
    min_choices = ["00"]
    hidden_field_tag(name, options_for_select(min_choices, appointment_min(appointment) ) )
  end

  def appointment_min(appointment)
    if appointment.appointment_time
      appointment.appointment_time.strftime('%M')
    else
      "00"
    end
  end

  def duration_hour_field(name, appointment)
    options = {
      "1 day" => "32400",
      "2 days" => "118800",
      "3 days" => "205200",
      "4 days" => "291600",
      "5 days" => "378000",
      "6 days" => "464400",
      "7 days" => "550800"
    }
    select_tag(name, options_for_select(options, get_duration_hour(appointment) ) )
  end

  def duration_minute_field(name, appointment)
    options = {
      "00 min" => "0"
    }
    hidden_field_tag(name, options_for_select(options, get_duration_min(appointment) ) )
  end

  def get_duration_hour(appointment)
    if appointment.duration
      ((appointment.duration/3600)*3600)
    else
      0
    end
  end

  def get_duration_min(appointment)
    if appointment.duration
      (appointment.duration % 3600)
    else
      1800
    end
  end

end
