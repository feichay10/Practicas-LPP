require 'owners'

class Car
  attr_reader :numId, :manufacturer, :year, :model, :milesPerGallon, :price, :owner, :kilometers, :comsuption  # getters

  def initialize(numId, manufacturer, year, model, milesPerGallon, price, owner, kilometers, comsuption)
    @numId = numId
    @manufacturer = manufacturer
    @year = year
    @model = model
    @milesPerGallon = milesPerGallon
    @price = price
    @owner = owner
    @kilometers = kilometers
    @comsuption = comsuption 
  end

  def checkKilometers(kilometers)
    if kilometers < 15000
      return "El coche es de ocasion"
    else
      return "El coche es de segunda mano"
    end
  end

  def checkYear(year)
   if year < 1900 || year > 2022
    return "Este coche no esta disponible"    
   else
    return "Este coche esta disponible"
   end
  end

  def distance_litres(litres)
    kilometers = ((litres * 100) / @comsuption).floor(4)
    return (kilometers/1.60934).floor(4)
  end

  def gallon_imperial(litres)
    return (litres * 4.54609).floor(4)
  end

  def gallon_US(litres)
    return (litres * 3.785).floor(4)
  end
end