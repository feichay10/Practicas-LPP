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