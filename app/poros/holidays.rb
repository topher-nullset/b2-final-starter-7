class Holidays
  attr_reader :name,
              :date

  def initialize(data)
    @name = data["name"]
    @date = data["date"]
  end
end