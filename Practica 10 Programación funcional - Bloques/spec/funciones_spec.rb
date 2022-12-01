#frozen_string_literal: true

RSpec.describe Funciones do
  describe "Interfaz de las funcionalidades - Aparcamiento::Funciones" do
    before :each do
      @conjunto1 = Aparcamiento::Conjunto.new(3.0, 3.0, 2.5, :libre)
      @conjunto2 = Aparcamiento::Conjunto.new(3.0, 3.0, 2.5, :libre)
      @conjunto3 = Aparcamiento::Conjunto.new(3.0, 3.0, 2.5, :completo)
      @conjunto4 = Aparcamiento::Conjunto.new(3.0, 3.0, 2.3, :libre)
      @conjunto7 = Aparcamiento::Conjunto.new(3.0, 3.0, 2.5, :libre)
      @conjunto8 = Aparcamiento::Conjunto.new(3.0, 3.0, 2.5, :libre)

      @conjunto_plazas1 = [@conjunto1, @conjunto2, @conjunto3, @conjunto4]
      @conjunto_plazas2 = [@conjunto1, @conjunto2, @conjunto5, @conjunto6, @conjunto7, @conjunto8]
      
      @datos_parking1 = Aparcamiento::Datos.new(4, 9, 999999, "Parking bolis BIC", :mixto, @conjunto_plazas, @conjunto_plazas2, @conjunto_plazas_ocupadas)
    end
  end 

  context "Testeo de las constantes" do
    it "Debe existir una constante para representar si el aparcamiento esta completo" do
      expect(Funciones::CONST_COMPLETO).not_to be(nil)
      expect(defined?Funciones::CONST_COMPLETO).to eq("constant")
      expect(Funciones::CONST_COMPLETO).to eq(:completo)
    end

    it "Debe existir una constante para representar si el aparcamiento tiene plazas libres" do
      expect(Funciones::CONST_LIBRE).not_to be(nil)
      expect(defined?Funciones::CONST_LIBRE).to eq("constant")
      expect(Funciones::CONST_LIBRE).to eq(:libre)
    end
  end

  context "Testeo para mostrar el estado de un aparcamiento" do
    it "Funcion estado_parking devuelve :libre si el numero de plazas libres es mayor que 0" do
      expect(Funciones.estado_parking(3)).to eq(:libre)
    end

    it "Funcion estado_parking devuelve :completo si el numero de plazas libres es 0" do
      expect(Funciones.estado_parking(0)).to eq(:completo)
    end
  end

  context "Herencia del módulo Aparcamiento" do
    it "Se espera que un aparcamiento sea un objeto de la clase Module" do
      expect(Aparcamiento.is_a?Module).to be(true)
    end

    it "Se espera que un aparcamiento sea un objeto (Objet)" do
      expect(Aparcamiento.is_a?Object).to be(true)
    end

    it "Se espera que un aparcamiento sea un objeto básico (BasicObject)" do
      expect(Aparcamiento.is_a?BasicObject).to be(true)
    end

    it "No se espera que un aparcamiento sea una clase (Class)" do
      expect(Aparcamiento.is_a?Class).to be(false)
    end

    it "No se espera que un aparcamiento sea un vehiculo (Vehiculo)" do
      expect(Aparcamiento.is_a?Aparcamiento::Vehiculo).to be(false)
    end

    it "No se espera que un aparcamiento se un vehiculo de motor (Motor)" do
      expect(Aparcamiento.is_a?Aparcamiento::Motor).to be(false)
    end
  end
end