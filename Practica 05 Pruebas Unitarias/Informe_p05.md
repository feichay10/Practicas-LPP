# Informe de la Practica 5: Test Unitarios

### Función totalPriceVehicles
Creo el programa `vehicles_operation.rb` y desarrollo la función `totalPriceVehicles`. Esta función recibe dos parametros que seria el numero de dias (numDays) y el precio de los dias (priceDay). Esta función lo que hace es realizar un multiplicacion del numero de dias por el precio por cada dia del alquiler del vehiculo.

```ruby
def totalPriceVehicles(numDays, priceDay)
  resultPrice = numDays * priceDay
end
```

### Función vehicleDiscount
La función `vehicleDiscount` recibe tres parametros, el numero de dias(numDays), el precio diario del vehiculo (priceDay) y el descuento que se va a aplicar (discountVehicle). Su funcionamiento es realizar el descuento del costo del alquiler del vehiculo.

```ruby
def vehicleDiscount(numDays, priceDay, discountVehicle)
  resultDiscount = totalPriceVehicles(numDays, priceDay) - totalPriceVehicles(numDays, priceDay) * discountVehicle
end
```

### Función kilometersTravelled
La función `kilometersTravelled` recibe dos parametros, el numero de kilometros del vehiculo que da el odómetro(kilometers) y el segundo el numero de kilometros nuevos en el momento de la entrega por parte del cliente(newKilometers).

```ruby
def kilometersTravelled(kilometers, newKilometers)
  newKilometers - kilometers
end
```

