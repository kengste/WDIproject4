module ClientsHelper
  def client_email(client)
    client.email if client.email != ""
  end

  def client_phone(client)
    client.phone_number if client.phone_number != ""
  end

  def client_name(client)
    if current_page?(clients_path)
      link_to client.name, client_path(client)
    else
      client.name
    end
  end

  def appointment_count(client)
    link_to "Total Appointments: #{client.appointment_count}", client_path(client)
  end
  
end
