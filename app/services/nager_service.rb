class NagerService

  def next_3_holidays
    response = connection.get("api/v3/NextPublicHolidays/US")
    parsed = JSON.parse(response.body)
    holidays = parsed.map { |data| Holidays.new(data) }
    holidays.first(3)
  end

  def connection
    Faraday.new(url: "https://date.nager.at/")
  end
end