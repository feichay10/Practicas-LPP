#frozen_string_literal: true

RSpec.describe Aparcamiento do
  before :all do
    @vehiculo_1 = Aparcamiento::Vehiculo.new("2901DGF", 1.5, 1.5, 4.0, 2)
    @vehiculo_2 = Aparcamiento::Vehiculo.new("6731MVC", 1.4, 1.7, 3.3, 3)
    @vehiculo_3 = Aparcamiento::Vehiculo.new("1234ABC", 1.8, 1.8, 3.4, 4)
    @vehiculo_4 = Aparcamiento::Vehiculo.new("4814KYP", 1.9, 1.6, 2.5, 2)
    @vehiculo_5 = Aparcamiento::Vehiculo.new("9821FEO", 1.9, 1.8, 3.2, 3)
    @conjunto_vehiculos_1 = [@vehiculo_1, @vehiculo_2, @vehiculo_3, @vehiculo_4, @vehiculo_5]

    # Objetos de la clase Conjunto (plazas)
    @conjunto1 = Aparcamiento::Conjunto.new(3.0, 3.0, 2.5, :libre)
    @conjunto2 = Aparcamiento::Conjunto.new(3.0, 3.0, 2.5, :libre)
    @conjunto3 = Aparcamiento::Conjunto.new(3.0, 3.0, 2.5, :ocupado)
    @conjunto4 = Aparcamiento::Conjunto.new(3.0, 3.0, 2.5, :ocupado)

    # Plazas para minusvalidos
    @conjunto5 = Aparcamiento::Conjunto.new(5.0, 5.0, 2.5, :libre)
    @conjunto6 = Aparcamiento::Conjunto.new(5.0, 5.0, 2.5, :ocupado)
    @conjunto_plazas = [@conjunto1, @conjunto2, @conjunto3, @conjunto4]
    @conjunto_plazas_libre = [@conjunto1, @conjunto2, @conjunto5]
    @conjunto_plazas_ocupadas = [@conjunto3, @conjunto4, @conjunto6]
  end


  describe Aparcamiento::EstacionamientoAeropuerto do
    context "Creacion de objetos de la clase EstacionamientoAeropuerto, test de errores y expectativas" do
      it "Instancia de un objeto de la clase EstacionamientoAeropuerto" do
        expect(Aparcamiento::EstacionamientoAeropuerto).not_to eq(nil)
      end

      it "Testeo de errores para cada parametro" do
        expect{Aparcamiento::EstacionamientoAeropuerto.new("2", 15, 20, 0.005, @conjunto_vehiculos_1, 0, 4, 000000 , "parking de la ESIT ULL", :cubierto, :guaguas, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas)}.to raise_error(ArgumentError)
        expect{Aparcamiento::EstacionamientoAeropuerto.new(5, 15, 20, 0.005, @conjunto_vehiculos_1, 5, 0, 111111, "parking del Meridiano", :mixto, :coches, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas)}.to raise_error(ArgumentError)
        expect{Aparcamiento::EstacionamientoAeropuerto.new(5.3, 15, 20, 0.005, @conjunto_vehiculos_1, 1, 7, "123456", "parking de la Arepera 23", :airelibre, :motos, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas)}.to raise_error(ArgumentError)
        expect{Aparcamiento::EstacionamientoAeropuerto.new(2, "15", 20, 0.005, @conjunto_vehiculos_1, 1, 7, 1236, "parking de la Arepera 23", :airelibre, :motos, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas)}.to raise_error(ArgumentError)
        expect{Aparcamiento::EstacionamientoAeropuerto.new(2, 15, 20, 0.005, @conjunto_vehiculos_1, 1, 7, 123456, 00, :airelibre, :motos, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas)}.to raise_error(ArgumentError)
        expect{Aparcamiento::EstacionamientoAeropuerto.new(2, 15, "20", 0.005, @conjunto_vehiculos_1, 1, 7, 123456, "parking de la Arepera 23", :fuera, :motos, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas)}.to raise_error(ArgumentError)
        expect{Aparcamiento::EstacionamientoAeropuerto.new(2, 15, 20.5, 0.005, @conjunto_vehiculos_1, 1, 7, 123456, "parking de la Arepera 23", :airelibre, :tanque, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas)}.to raise_error(ArgumentError)
        expect{Aparcamiento::EstacionamientoAeropuerto.new(2, 15, 20, "0.005", @conjunto_vehiculos_1, 1, 7, 123456, "parking de la Arepera 23", :airelibre, :motos, 00, [], [])}.to raise_error(ArgumentError)
        expect{Aparcamiento::EstacionamientoAeropuerto.new(2, 15, 20, 1, @conjunto_vehiculos_1, 1, 7, 123456, "parking de la Arepera 23", :airelibre, :motos, 00, [], [])}.to raise_error(ArgumentError)
        expect{Aparcamiento::EstacionamientoAeropuerto.new(2, 15, 20, 0.005, "conjunto_vehiculos", 1, 7, 123456, "parking de la Arepera 23", :airelibre, :motos, 00, [], [])}.to raise_error(ArgumentError)
      end

      it "Testeo de getters para cada parametro" do
        parking = Aparcamiento::EstacionamientoAeropuerto.new(2, 15.0, 20, 0.005, @conjunto_vehiculos_1, 4, 9, 999999, "parking bolis BIC", :mixto, :coches, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas)
        expect(parking.num_plantas).to eq(2)
        expect(parking.distancia).to eq(15.0)
        expect(parking.minusvalidos).to eq(20)
        expect(parking.precio).to eq(0.005)
        expect(parking.conjunto_vehiculos).to eq(@conjunto_vehiculos_1)
      end
    end

    context "Herencia de la clase EstacionamientoAeropuerto" do
      it "Testeo de la instancia de objetos sea de tipo 'EstacionamientoAeropuerto'" do
        tnf_norte = Aparcamiento::EstacionamientoAeropuerto.new(2, 15.0, 20, 0.005, @conjunto_vehiculos_1, 4, 9, 999999, "Parking Tenerife Norte", :mixto, :coches, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas)
        expect(tnf_norte.is_a?Aparcamiento::EstacionamientoAeropuerto).to eq(true)
      end

      it "Testeo de la instancia de objetos sea de tipo 'Parking'" do
        tnf_norte = Aparcamiento::EstacionamientoAeropuerto.new(2, 15.0, 20, 0.005, @conjunto_vehiculos_1, 4, 9, 999999, "Parking Tenerife Norte", :mixto, :coches, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas)
        expect(tnf_norte.is_a?Aparcamiento::Parking).to eq(true)
      end

      it "Testeo de la instancia de objetos sea de tipo 'Object'" do
        tnf_norte = Aparcamiento::EstacionamientoAeropuerto.new(2, 15.0, 20, 0.005, @conjunto_vehiculos_1, 4, 9, 999999, "Parking Tenerife Norte", :mixto, :coches, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas)
        expect(tnf_norte.is_a?Object).to eq(true)
      end

      it "Testeo de la instancia de objetos sea de tipo 'BasicObject'" do
        tnf_norte = Aparcamiento::EstacionamientoAeropuerto.new(2, 15.0, 20, 0.005, @conjunto_vehiculos_1, 4, 9, 999999, "Parking Tenerife Norte", :mixto, :coches, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas)
        expect(tnf_norte.is_a?BasicObject).to eq(true)
      end
    end
  end
end