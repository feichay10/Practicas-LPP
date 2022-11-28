# Practica 06 Desarrollo Dirigido por Pruebas - TDD

* Cheuk Kelly Ng Pante (alu0101364544@ull.edu.es)

### Spec car_spec
El primer test es para inicializar los atributos de clase Car, aqui el codigo: 
```Ruby
it "Se instancia un coche" do
    expect(Car.new(53451, "Hyundai", 2013, "ix35", 1000, 15000)).not_to eq(nil)
end
```

El segundo test es para comprobar que un coche tenga un identicador: 
```ruby
it "Se comprueba que el coche tiene un identificador" do
  expect(Car.new(53451, "Hyundai", 2013, "ix35", 1000, 15000).numId).to eq(53451)
  expect(Car.new(53451, "Hyundai", 2013, "ix35", 1000, 15000).manufacturer).to eq("Hyundai")
  expect(Car.new(53451, "Hyundai", 2013, "ix35", 1000, 15000).year).to eq(2013)
  expect(Car.new(53451, "Hyundai", 2013, "ix35", 1000, 15000).model).to eq("ix35")
  expect(Car.new(53451, "Hyundai", 2013, "ix35", 1000, 15000).milesPerGallon).to eq(1000)
  expect(Car.new(53451, "Hyundai", 2013, "ix35", 1000, 15000).price).to eq(15000)
end
```

El tercer test es para comprobar que el coche tiene un usuario:
```ruby
it "Se comprueba que el coche tiene un propietario" do
  expect(Car.new(53451, "Hyundai", 2013, "ix35", 1000, 15000, @owners).owner.numPhone).to eq(612345678)
  expect(Car.new(53451, "Hyundai", 2013, "ix35", 1000, 15000, @owners2).owner.name).to eq("Antonio")
end
```

El cuarto test es para comprobar si el coche es de ocasión o de segunda mano:
```ruby
it "Se comprueba el kilometraje del coche" do 
  expect(@opel.checkKilometers(0)).to eq("El coche es de ocasion")
  expect(@lamborghini.checkKilometers(50000)).to eq("El coche es de segunda mano")
end
```

El quinto test es para comprobar si el coche está fabrica entre 1900 y 2022:
```ruby
it "Se comprueba que el coche esta disponible" do
  expect(@fiat.checkYear(1899)).to eq("Este coche no esta disponible")
  expect(@lamborghini.checkYear(2010)).to eq("Este coche esta disponible")
end
```

El sexto test es para comprobar la distancia que puede hacer con los litros que se le pasa a la función:
```ruby
it "Se comprueba el consumo del coche" do
  cocheNuevo = Car.new(12094, "Mercedes", 2001, "benz", 800, 300000, "Chistem", 50000, 21.43)
  expect(cocheNuevo.distance_litres(112.34)).to eq(325.7349) 
end
```

El septimo test es para comprobar los litros por galones:
```ruby
it "Se comprueba los litros por galones" do
    cocheGalImperial = Car.new(922928, "Seat", 1998, "Panda", 900, 7000, "Castolo", 100, 45.11)
    cocheGalUSA = Car.new(00000, "Toyota", 2018, "Aigo", 654, 9000, "Cetaceo", 80000, 67.89)
    expect(cocheGalImperial.gallon_imperial(35)).to eq(159.1131)
    expect(cocheGalUSA.gallon_US(50)).to eq(189.25)
end
```

El spec al final quedará de la siguiente manera:
```ruby
require 'car'
require 'owners'

describe Car do
  before :all do
    @owners = Owners.new(612345678, "Cheuk")
    @owners2 = Owners.new(666666666, "Antonio")
    @opel = Car.new(12345, "Opel", 2001, "Astra", 700, 8000, @owner, 0, 11.2)
    @lamborghini = Car.new(54321, "Lamborghini", 2010, "Gallardo", 1000, 200000, @owner2, 50000, 13.6)
    @fiat = Car.new(76894, "fiat", 1899, "agnolli", 800, 300000, "Pedro", 200000, 56.9)
  end

  it "Se instancia un coche" do
    expect(Car.new(53451, "Hyundai", 2013, "ix35", 1000, 15000, "Diego", 32000, 56.78)).not_to eq(nil)
  end

  it "Se comprueba que el coche tiene un identificador" do
    expect(Car.new(53451, "Hyundai", 2013, "ix35", 1000, 15000, "Diego", 32000, 56.78).numId).to eq(53451)
    expect(Car.new(53451, "Hyundai", 2013, "ix35", 1000, 15000, "Diego", 32000, 56.78).manufacturer).to eq("Hyundai")
    expect(Car.new(53451, "Hyundai", 2013, "ix35", 1000, 15000, "Diego", 32000, 56.78).year).to eq(2013)
    expect(Car.new(53451, "Hyundai", 2013, "ix35", 1000, 15000, "Diego", 32000, 56.78).model).to eq("ix35")
    expect(Car.new(53451, "Hyundai", 2013, "ix35", 1000, 15000, "Diego", 32000, 56.78).milesPerGallon).to eq(1000)
    expect(Car.new(53451, "Hyundai", 2013, "ix35", 1000, 15000, "Diego", 32000, 56.78).price).to eq(15000)
    expect(Car.new(53451, "Hyundai", 2013, "ix35", 1000, 15000, "Diego", 32000, 56.78).owner).to eq("Diego")
    expect(Car.new(53451, "Hyundai", 2013, "ix35", 1000, 15000, "Diego", 32000, 56.78).kilometers).to eq(32000)
    expect(Car.new(53451, "Hyundai", 2013, "ix35", 1000, 15000, "Diego", 32000, 56.78).comsuption).to eq(56.78)
  end

  it "Se comprueba que el coche tiene un propietario" do
    expect(Car.new(53451, "Hyundai", 2013, "ix35", 1000, 15000, @owners, 55000, 13.45).owner.numPhone).to eq(612345678)
    expect(Car.new(53451, "Hyundai", 2013, "ix35", 1000, 15000, @owners2, 55000, 13.45).owner.name).to eq("Antonio")
  end

  it "Se comprueba el kilometraje del coche" do 
    expect(@opel.checkKilometers(0)).to eq("El coche es de ocasion")
    expect(@lamborghini.checkKilometers(50000)).to eq("El coche es de segunda mano")
  end

  it "Se comprueba que el coche esta disponible" do
    expect(@fiat.checkYear(1899)).to eq("Este coche no esta disponible")
    expect(@lamborghini.checkYear(2010)).to eq("Este coche esta disponible")
  end

  it "Se comprueba el consumo del coche" do
    cocheNuevo = Car.new(12094, "Mercedes", 2001, "benz", 800, 300000, "Chistem", 50000, 21.43)
    expect(cocheNuevo.distance_litres(112.34)).to eq(325.7349) 
  end

  it "Se comprueba los litros por galones" do
    cocheGalImperial = Car.new(922928, "Seat", 1998, "Panda", 900, 7000, "Castolo", 100, 45.11)
    cocheGalUSA = Car.new(00000, "Toyota", 2018, "Aigo", 654, 9000, "Cetaceo", 80000, 67.89)
    expect(cocheGalImperial.gallon_imperial(35)).to eq(159.1131)
    expect(cocheGalUSA.gallon_US(50)).to eq(189.25)
  end
end
```

### Spec owners_spec
El primer test es para inicializar los atributos de clase Owners, aqui el codigo: 
```ruby
it "Se instancia un propietario" do
  expect(Owners.new(666666666, "Cheuk")).not_to eq(nil)
end
```

### Clase Car
Creamos la clase `Car` para representar los coches de ocasion y de segunda mano. Además, inicializamos los atributos que seria el el número de identificación, el fabricante, el añoo de fabricación,
el modelo, las millas por galón, y el precio en euros del vehículo.

```ruby
class Car
  attr_reader :numId, :manufacturer, :year, :model, milesPerGallon, :price

  def initialize(numId, manufacturer, year, model, milesPerGallon, price)
    @numId = numId
    @manufacturer = manufacturer
    @year = year
    @model = model
    @milesPerGallon = milesPerGallon
    @price = price
  end
end
```

Ahora hemos realizados cambios en la clase Car, se ha incluido la clase `Owners` a la clase `Car` para inicializar objetos de esa clase:
```ruby
require 'owners'

class Car
  attr_reader :numId, :manufacturer, :year, :model, :milesPerGallon, :price, :owner

  def initialize(numId, manufacturer, year, model, milesPerGallon, price, owner)
    @numId = numId
    @manufacturer = manufacturer
    @year = year
    @model = model
    @milesPerGallon = milesPerGallon
    @price = price
    @owner = owner     
  end
end
```

En la clase `Car` vamos a crear un método para comprobar que el coche es de ocasión o de segunda mano:
```ruby
def checkKilometers(kilometers)
  if kilometers < 15000
    return "El coche es de ocasion"
  else
    return "El coche es de segunda mano"
  end
end
```

Decimos que si un coche tienes menos de 15000 Kilometros es nuevo.

Creamos otro metodo para comprobar que el coche está fabricado entre 1900 y 2022:
```ruby
def checkYear(year)
  if year < 1900 || year > 2022
    return "Este coche no esta disponible"    
  else
    return "Este coche esta disponible"
  end
end
```

Este método, `distance_litres` es para devolver la distancia que puede hacer con los litros que tiene:
```ruby
def distance_litres(litres)
  kilometers = ((litres * 100) / @comsuption).floor(4)
  return (kilometers/1.60934).floor(4)
end
```

El método `gallon_imperial` pasa los litros por la unidad de gallon imperial:
```ruby
def gallon_imperial(litres)
  return (litres * 4.54609).floor(4)
end
```

El método `gallon_US` pasa los litros por la unidad de gallon estadounidense:
```ruby
def gallon_US(litres)
  return (litres * 3.785).floor(4)
end
```

### Clase Owners
Se ha creado la clase `Owners` para saber los propietarios que ha tenido el vehiculo con el numero de teléfono y un nombre:
```ruby
class Owners 
  attr_reader :numPhone, :name

  def initialize(numPhone, name)
    @numPhone = numPhone
    @name = name
  end
end 
```
