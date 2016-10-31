class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :client
  belongs_to :staff

  accepts_nested_attributes_for :client
  accepts_nested_attributes_for :staff

  def start_time
    self.appointment_time
  end

  def end_time
    appointment_time + duration.seconds
  end

  def client_name
    client.name
  end

  def staff_name
    staff.first_name if staff
  end

  def client_attributes=(atts)
    if atts[:name] != ""
      self.client = self.user.clients.find_or_create_by(atts)
    end
  end

  def staff_attributes=(atts)
    if atts[:first_name] != ""
      staff = self.user.staffs.find_or_create_by(atts)
      self.staff = staff
    end
  end

  def appointment_time=(time)
    if time.is_a?(Hash)
      self[:appointment_time] = parse_datetime(time)
    else
      self[:appointment_time] = time
    end
  end

  def parse_date(string)
    array = string.split("/")
    first_item = array.pop
    array.unshift(first_item).join("-")
  end

  def parse_datetime(hash)
    if hash["date"].match(/\d{2}\/\d{2}\/\d{4}/)
      Time.zone.parse("#{parse_date(hash["date"])} #{hash["hour"]}:#{hash["min"]}")
    end
  end

  def duration=(duration)
    if duration.is_a?(Hash)
      self[:duration] = parse_duration(duration)
    else
      self[:duration] = duration
    end
  end

  def parse_duration(hash)
    hash["hour"].to_i + hash["min"].to_i
  end

end
