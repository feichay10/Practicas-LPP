# frozen_string_literal: true

RSpec.describe FuncionalidadesAparcamiento do
  before :all do
    @vehiculo_1 = Aparcamiento::Vehiculo.new("2901DGF", 1.5, 1.5, 4.0, 2)
    @vehiculo_2 = Aparcamiento::Vehiculo.new("6731MVC", 1.4, 1.7, 3.3, 3)
    @vehiculo_3 = Aparcamiento::Vehiculo.new("1234ABC", 1.8, 1.8, 3.4, 4)
    @vehiculo_4 = Aparcamiento::Vehiculo.new("4814KYP", 1.9, 1.6, 2.5, 2)
    @vehiculo_5 = Aparcamiento::Vehiculo.new("9821FEO", 1.9, 1.8, 3.2, 3)
    @motor1 = Aparcamiento::Motor.new(2, 4, 120, 90)
    @motor2 = Aparcamiento::Motor.new(3, 1, 100, 80)
    @conjunto_vehiculos_1 = [@vehiculo_1, @vehiculo_2, @vehiculo_3, @vehiculo_4, @vehiculo_5]
    @conjunto_vehiculos_2 = [@vehiculo_1, @vehiculo_2, @vehiculo_3, @vehiculo_4, @motor1, @motor2]

    # Objetos de la clase Conjunto (plazas)
    @conjunto1 = Aparcamiento::Conjunto.new(3.0, 3.0, 2.5, :libre)
    @conjunto2 = Aparcamiento::Conjunto.new(3.0, 3.0, 2.5, :libre)
    @conjunto3 = Aparcamiento::Conjunto.new(3.0, 3.0, 2.5, :ocupado)
    @conjunto4 = Aparcamiento::Conjunto.new(3.0, 3.0, 2.5, :ocupado)

    # Plazas para minusvalidos
    @conjunto5 = Aparcamiento::Conjunto.new(5.0, 5.0, 2.5, :libre)
    @conjunto6 = Aparcamiento::Conjunto.new(5.0, 5.0, 2.5, :ocupado)
    @conjunto7 = Aparcamiento::Conjunto.new(5.0, 5.0, 2.5, :ocupado)
    @conjunto8 = Aparcamiento::Conjunto.new(5.0, 5.0, 2.5, :libre)
    @conjunto9 = Aparcamiento::Conjunto.new(5.0, 5.0, 2.5, :libre)
    @conjunto10 = Aparcamiento::Conjunto.new(5.0, 5.0, 2.5, :libre)
    @conjunto_plazas = [@conjunto1, @conjunto2, @conjunto3, @conjunto4, @conjunto5, @conjunto6, @conjunto7, @conjunto8, @conjunto9, @conjunto10, @conjunto10, @conjunto2, @conjunto3, @conjunto4, @conjunto5, @conjunto6, @conjunto7, @conjunto8, @conjunto9, @conjunto10, @conjunto1, @conjunto2, @conjunto3, @conjunto4, @conjunto5, @conjunto6, @conjunto7, @conjunto8, @conjunto9, @conjunto10, @conjunto10, @conjunto2, @conjunto3, @conjunto4, @conjunto5, @conjunto6, @conjunto7, @conjunto8, @conjunto9, @conjunto10, @conjunto1, @conjunto2, @conjunto3, @conjunto4, @conjunto5, @conjunto6, @conjunto7, @conjunto8, @conjunto9, @conjunto10, @conjunto10, @conjunto2, @conjunto3, @conjunto4, @conjunto5, @conjunto6, @conjunto7, @conjunto8, @conjunto9, @conjunto10]
    @conjunto_plazas_libre = [@conjunto1, @conjunto2, @conjunto5]
    @conjunto_plazas_ocupadas = [@conjunto3, @conjunto4, @conjunto6]
    @conjunto_plazas_minusvalidos = [@conjunto5, @conjunto6]
  end

  context "Testeo de las diferentes funcionalidades del modulo de funcionalidades de los estacionamientos" do
    it "Testeo de la funcionalidad que permite aparcar vehiculos" do
      tnf_norte_aero = Aparcamiento::EstacionamientoAeropuerto.new(2, 15.0, 20, 0.005, @conjunto_vehiculos_1, 4, 9, 999999, "Parking Aeropuerto Tenerife Norte", :mixto, :coches, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas)
      estacion_trinidad = Aparcamiento::EstacionamientoEstacionTren.new(2, 15.0, 20, 0.005, @conjunto_vehiculos_2, 4, 9, 999999, "Estacion Trinidad", :mixto, :coches, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas)
      expect(tnf_norte_aero.aparcar_vehiculo(@vehiculo_1)).to eq(true)
      expect(estacion_trinidad.aparcar_vehiculo(@motor1)).to eq(true)
    end

    it "Testeo de la funcionalidad que determina la duracion de la estancia de un vehiculo dadas unas horas de entrada y salida" do
      tnf_norte_aero = Aparcamiento::EstacionamientoAeropuerto.new(2, 15.0, 20, 0.005, @conjunto_vehiculos_1, 4, 9, 999999, "Parking Aeropuerto Tenerife Norte", :mixto, :coches, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas)
      estacion_trinidad = Aparcamiento::EstacionamientoEstacionTren.new(2, 15.0, 20, 0.005, @conjunto_vehiculos_2, 4, 9, 999999, "Estacion Trinidad", :mixto, :coches, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas)
      expect(tnf_norte_aero.duracion_estancia("8:00", "16:00" )).to eq(480)
      expect(estacion_trinidad.duracion_estancia("12:00", "23:00" )).to eq(660)
      # expect(tnf_norte_aero.duracion_estancia(8, 16)).to raise_error(ArgumentError)
      # expect(estacion_trinidad.duracion_estancia(12, 23)).to raise_error(ArgumentError)
    end

    it "Testeo de la funcionalidad que calcula el importe a pagar por un vehiculo dada una duracion" do
      tnf_norte_aero = Aparcamiento::EstacionamientoAeropuerto.new(2, 15.0, 20, 0.005, @conjunto_vehiculos_1, 4, 9, 999999, "Parking Aeropuerto Tenerife Norte", :mixto, :coches, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas)
      estacion_trinidad = Aparcamiento::EstacionamientoEstacionTren.new(2, 15.0, 20, 0.005, @conjunto_vehiculos_2, 4, 9, 999999, "Estacion Trinidad", :mixto, :coches, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas)
      expect(tnf_norte_aero.precio_estancia(480)).to eq(2.4)
      expect(estacion_trinidad.precio_estancia(660)).to eq(3.3000000000000003)
    end

    it "Testeo de la funcionalidad para determinar si un aparcamiento cumple con el porcentaje de reserva de plazas para minusvalidos" do
      tnf_norte_aero = Aparcamiento::EstacionamientoAeropuerto.new(2, 15.0, 2, 0.005, @conjunto_vehiculos_1, 4, 9, 999999, "Parking Aeropuerto Tenerife Norte", :mixto, :coches, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas)
      estacion_trinidad = Aparcamiento::EstacionamientoEstacionTren.new(2, 15.0, 2, 0.005, @conjunto_vehiculos_2, 4, 9, 999999, "Estacion Trinidad", :mixto, :coches, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas)
      expect(tnf_norte_aero.reserva_plazas_minusvalidos).to eq(true)
      expect(estacion_trinidad.reserva_plazas_minusvalidos).to eq(true)
    end

    it "Testeo de la funcionalidad para determinar el numero de plazas para minusvalidos libres de un aparcamiento" do
      tnf_norte_aero = Aparcamiento::EstacionamientoAeropuerto.new(2, 15.0, 20, 0.005, @conjunto_vehiculos_1, 4, 9, 999999, "Parking Aeropuerto Tenerife Norte", :mixto, :coches, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas)
      estacion_trinidad = Aparcamiento::EstacionamientoEstacionTren.new(2, 15.0, 20, 0.005, @conjunto_vehiculos_2, 4, 9, 999999, "Estacion Trinidad", :mixto, :coches, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas)
      expect(tnf_norte_aero.numero_plazas_minusvalidos_libres).to eq(20)
      expect(estacion_trinidad.numero_plazas_minusvalidos_libres).to eq(20)
    end

    it "Testeo de la funcionalidad para determinar el numero de vehiculos estacionados en un aparcamiento" do
      tnf_norte_aero = Aparcamiento::EstacionamientoAeropuerto.new(2, 15.0, 20, 0.005, @conjunto_vehiculos_1, 4, 9, 999999, "Parking Aeropuerto Tenerife Norte", :mixto, :coches, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas)
      estacion_trinidad = Aparcamiento::EstacionamientoEstacionTren.new(2, 15.0, 20, 0.005, @conjunto_vehiculos_2, 4, 9, 999999, "Estacion Trinidad", :mixto, :coches, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas)
      expect(tnf_norte_aero.numero_vehiculos_estacionados).to eq(5)
      expect(estacion_trinidad.numero_vehiculos_estacionados).to eq(6)
    end
  end
end