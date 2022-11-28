def totalPriceVehicles(numDays, priceDay)
  resultPrice = numDays * priceDay
end

def vehicleDiscount(numDays, priceDay, discountVehicle)
  resultDiscount = totalPriceVehicles(numDays, priceDay) - totalPriceVehicles(numDays, priceDay) * discountVehicle
end

def kilometersTravelled(kilometers, newKilometers)
  newKilometers - kilometers
end