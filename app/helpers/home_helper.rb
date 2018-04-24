module HomeHelper
  def display_time(datetime)
    formatted = datetime.strftime("%e %b %Y %H:%M:%S %p")
  end
end
