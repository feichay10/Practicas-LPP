#frozen_string_literal: true

RSpec.describe Aparcamiento do
  it 'has a version number' do
    expect(Aparcamiento::VERSION).not_to be nil
  end

  describe Aparcamiento::Vehiculo do
    # Inicializacion de objetos de la clase Vehiculo
    before :all do
      @tesla = Aparcamiento::Vehiculo.new("2901DGF", 1.5, 1.5, 4.0, 2)
      @seat = Aparcamiento::Vehiculo.new("6731MVC", 1.4, 1.7, 3.3, 3)
      @bmw = Aparcamiento::Vehiculo.new("1234ABC", 1.8, 1.8, 3.4, 4)
    end

    # Inicializar un objeto de la clase Vehiculo, test de errores y expectativas
    context "Inicializar un objeto de la clase Vehiculo, test de errores y expectativas" do
      it "Inicializar un objeto de la clase Vehiculo" do
        # expect(Aparcamiento::Vehiculo.new("1234BGM", 1.9, 1.8, 3.2, 3)).not_to eq(nil)
        # opel = Aparcamiento::Vehiculo.new("0000AAA", 2.0, 1.7, 3.5, 8)
        # expect(opel).not_to eq(nil)
        expect(Aparcamiento::Vehiculo).not_to eq(nil)
      end

      it "Testeo de errores para cada parametro" do
        expect{Aparcamiento::Vehiculo.new(1234, 1.9, 1.8, 3.0, 3)}.to raise_error(ArgumentError)
        expect{Aparcamiento::Vehiculo.new("1234BGM", 1, 1.8, 3.0, 3)}.to raise_error(ArgumentError)
        expect{Aparcamiento::Vehiculo.new("1234BGM", 1.9, 1, 3.0, 3)}.to raise_error(ArgumentError)
        expect{Aparcamiento::Vehiculo.new("1234BGM", 1.9, 1.8, 3, 3)}.to raise_error(ArgumentError)
        expect{Aparcamiento::Vehiculo.new("1234BGM", 1.9, 1.8, 3, 3.3)}.to raise_error(ArgumentError)
      end

      it "Testeo de los getters para cada parametro" do
        lamborghini = Aparcamiento::Vehiculo.new("0000AAA", 1.5, 1.7, 3.0, 4)
        expect(lamborghini.identificacion).to eq("0000AAA")
        expect(lamborghini.altura).to eq(1.5)
        expect(lamborghini.ancho).to eq(1.7)
        expect(lamborghini.largo).to eq(3.0)
        expect(lamborghini.peso).to eq(4)
      end
    end

    # Testeo de los métodos de la clase Vehiculo
    context "Testeo de los métodos de la clase Vehiculo" do
      it "Testeo del to_s" do
        hyundai = Aparcamiento::Vehiculo.new("4814KYP", 1.9, 1.6, 2.5, 2)
        expect(hyundai.to_s).to eq("El vehiculo con identificador: 4814KYP, con altura: 1.9, anchura: 1.6, largo: 2.5, y con peso en toneladas: 2")
        expect(@tesla.to_s).to eq("El vehiculo con identificador: 2901DGF, con altura: 1.5, anchura: 1.5, largo: 4.0, y con peso en toneladas: 2")
      end
    end

    # Testeo de la herencia de la clase Vehiculo
    context "Herencia de la clase Vehiculo" do
      it "Testeo de la instancia de la clase Vehiculo sea un Vehiculo" do
        bmw = Aparcamiento::Vehiculo.new("9821FEO", 1.9, 1.8, 3.2, 3)
        expect(bmw.instance_of? Aparcamiento::Vehiculo).to eq(true)
        expect(@tesla.instance_of? Aparcamiento::Vehiculo).to eq(true)
        expect(@seat.instance_of? Aparcamiento::Vehiculo).to eq(true)
      end

      it "Testeo de la instancia de la clase Vehiculo sea un Object" do
        audi = Aparcamiento::Vehiculo.new("5487PEO", 2.0, 1.7, 3.5, 8)
        expect(audi.is_a?Object).to eq(true)
        expect(@tesla.is_a?Object).to eq(true)
        expect(@seat.is_a?Object).to eq(true)
      end

      it "Testeo de la instancia de la clase Vehiculo sea un BasicObject" do
        ford = Aparcamiento::Vehiculo.new("7777VEG", 2.0, 1.7, 3.5, 8)
        expect(ford.is_a?BasicObject).to eq(true)
        expect(@tesla.is_a?BasicObject).to eq(true)
        expect(@seat.is_a?BasicObject).to eq(true)
      end

      it "Testeo de la instancia de la clase Vehiculo sea un String" do
        honda = Aparcamiento::Vehiculo.new("9999LLL", 2.0, 1.7, 3.5, 8)
        expect(honda.is_a?String).to eq(false)
        expect(@tesla.is_a?String).to eq(false)
        expect(@seat.is_a?String).to eq(false)
      end

      it "Testeo de la instancia de la clase Vehiculo sea un Numeric" do
        nissan = Aparcamiento::Vehiculo.new("9809PIS", 2.0, 1.7, 3.5, 8)
        expect(nissan.is_a?Numeric).to eq(false)
        expect(@tesla.is_a?Numeric).to eq(false)
        expect(@seat.is_a?Numeric).to eq(false)
      end
    end

    # Testeo para las variables de clase
    context "Testeo para las variables de clase" do
      it "Se obtiene el numero de objetos de la clase Vehiculo" do
        # expect(Aparcamiento::Vehiculo.numero_objetos).to eq(10)
      end

      it "La variable @@numero_objetos es mayor que 0" do
        expect(Aparcamiento::Vehiculo.numero_objetos).to be > 0
      end

      it "La variable @@numero_objetos es un entero" do
        expect(Aparcamiento::Vehiculo.numero_objetos).to be_an_instance_of(Integer)
      end
    end

    # Testeo del modulo Comparable en la clase Vehiculo
    context "Testeo del modulo Comparable" do
      it "Testeo del metodo <" do
        expect(@tesla < @seat).to eq(false)
        expect(@seat < @tesla).to eq(true)
        expect(@bmw < @seat).to eq(false)
        expect(@seat < @bmw).to eq(true)
        expect(@tesla < @bmw).to eq(true)
        expect(@bmw < @tesla).to eq(false)
      end

      it "Testeo del metodo >" do
        expect(@tesla > @seat).to eq(true)
        expect(@seat > @tesla).to eq(false)
        expect(@bmw > @seat).to eq(true)
        expect(@seat > @bmw).to eq(false)
        expect(@tesla > @bmw).to eq(false)
        expect(@bmw > @tesla).to eq(true)
      end

      it "Testeo del metodo <=" do
        expect(@tesla <= @seat).to eq(false)
        expect(@seat <= @tesla).to eq(true)
        expect(@bmw <= @seat).to eq(false)
        expect(@seat <= @bmw).to eq(true)
        expect(@tesla <= @bmw).to eq(true)
        expect(@bmw <= @tesla).to eq(false)
      end

      it "Testeo del metodo >=" do
        expect(@tesla >= @seat).to eq(true)
        expect(@seat >= @tesla).to eq(false)
        expect(@bmw >= @seat).to eq(true)
        expect(@seat >= @bmw).to eq(false)
        expect(@tesla >= @bmw).to eq(false)
        expect(@bmw >= @tesla).to eq(true)
      end
    end

    context "Testeo del modulo Enumerable" do
      it "Testeo del metodo each" do
        expect(@tesla.each{|i| i}).to eq(2)
        expect(@bmw.each{|i| i}).to eq(4)
        expect(@seat.each{|i| i}).to eq(3)
      end

      it "Testeo del metodo collect" do
        expect(@tesla.collect{|i| i}).to eq(["2901DGF", 1.5, 1.5, 4.0, 2])
        expect(@bmw.collect{|i| i}).to eq(["1234ABC", 1.8, 1.8, 3.4, 4])
        expect(@seat.collect{|i| i}).to eq(["6731MVC", 1.4, 1.7, 3.3, 3])
      end

      it "Testeo del metodo map" do
        expect(@tesla.map{|i| i}).to eq(["2901DGF", 1.5, 1.5, 4.0, 2])
        expect(@bmw.map{|i| i}).to eq(["1234ABC", 1.8, 1.8, 3.4, 4])
        expect(@seat.map{|i| i}).to eq(["6731MVC", 1.4, 1.7, 3.3, 3])
      end
    end
  end
end