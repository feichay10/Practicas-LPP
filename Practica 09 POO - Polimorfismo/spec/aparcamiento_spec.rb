#frozen_string_literal: true

RSpec.describe Aparcamiento do
  it "has a version number" do
    expect(Aparcamiento::VERSION).not_to be nil
  end

  describe Aparcamiento::Parking do
    before :all do
      @conjunto1 = Aparcamiento::Conjunto.new(3.0, 3.0, 2.5, :libre)
      @conjunto2 = Aparcamiento::Conjunto.new(3.0, 3.0, 2.5, :libre)
      @conjunto3 = Aparcamiento::Conjunto.new(3.0, 3.0, 2.5, :ocupado)
      @conjunto4 = Aparcamiento::Conjunto.new(3.0, 3.0, 2.5, :ocupado)
      @conjunto_plazas = [@conjunto1, @conjunto2, @conjunto3, @conjunto4]
      @conjunto_plazas_libre = [@conjunto1, @conjunto2]
      @conjunto_plazas_ocupadas = [@conjunto3, @conjunto4]
    end

    it "Inicializar un objeto de la clase Parking" do
      expect(Aparcamiento::Parking.new(3, 4, 312399, "Parking de la ESIT ULL", :cubierto, :guaguas, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas)).not_to be nil
      expect(Aparcamiento::Parking.new(5, 10, 111111, "Parking del Meridiano", :mixto, :coches, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas)).not_to be nil
      parking1 = Aparcamiento::Parking.new(1, 7, 123456, "Parking de la Arepera 23", :airelibre, :motos, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas)
      expect(parking1).not_to be nil
    end

    # it "Testeo de errores para cada parametro" do
    #   expect{Aparcamiento::Parking.new(0, 4, 000000 , "Parking de la ESIT ULL", :cubierto, :guaguas, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas)}.not_to raise_error(ArgumentError)
    #   expect{Aparcamiento::Parking.new(5, 0, 111111, "Parking del Meridiano", :mixto, :coches, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas)}.not_to raise_error(ArgumentError)
    #   expect{Aparcamiento::Parking.new(1, 7, "123456", "Parking de la Arepera 23", :airelibre, :motos, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas)}.not_to raise_error(ArgumentError)
    #   expect{Aparcamiento::Parking.new(1, 7, 1236, "Parking de la Arepera 23", :airelibre, :motos, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas)}.not_to raise_error(ArgumentError)
    #   expect{Aparcamiento::Parking.new(1, 7, 123456, 00, :airelibre, :motos, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas)}.not_to raise_error(ArgumentError)
    #   expect{Aparcamiento::Parking.new(1, 7, 123456, "Parking de la Arepera 23", :fuera, :motos, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas)}.not_to raise_error(ArgumentError)
    #   expect{Aparcamiento::Parking.new(1, 7, 123456, "Parking de la Arepera 23", :airelibre, :tanque, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas)}.not_to raise_error(ArgumentError)
    #   expect{Aparcamiento::Parking.new(1, 7, 123456, "Parking de la Arepera 23", :airelibre, :motos, 00, [], [])}.not_to raise_error(ArgumentError)
    # end

    it "Testeo de los getters para cada parametro" do
      parking = Aparcamiento::Parking.new(4, 9, 999999, "Parking bolis BIC", :mixto, :coches, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas)
      expect(parking.accesibilidad).to eq(4)
      expect(parking.seguridad).to eq(9)
      expect(parking.identificacion).to eq(999999)
      expect(parking.nombre_comercial).to eq("Parking bolis BIC")
      expect(parking.descripcion).to eq(:mixto)
      expect(parking.tipo).to eq(:coches)
      expect(parking.conjunto_plazas).to eq(@conjunto_plazas)
      expect(parking.conjunto_plazas_libre).to eq(@conjunto_plazas_libre)
      expect(parking.conjunto_plazas_ocupadas).to eq(@conjunto_plazas_ocupadas)
    end

    it "Testeo de la constante para saber si el aparcamiento está lleno" do
      parking = Aparcamiento::Parking.new(1, 1, 111111, "Parking", :cubierto, :guaguas, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas)
      expect(parking.PLAZAS_LLENA).to eq(:plazaslibres)
      conjunto_plazas1 = [@conjunto3, @conjunto4]
      parking1 = Aparcamiento::Parking.new(1, 1, 111111, "Parking", :cubierto, :guaguas, conjunto_plazas1, @conjunto_plazas_libre, @conjunto_plazas_ocupadas)
      expect(parking1.PLAZAS_LLENA).to eq(:plazasocupadas)
    end

    it "Testeo de la constante para saber si el aparcamiento está libre" do
      parking = Aparcamiento::Parking.new(1, 1, 111111, "Parking del Mercadona", :mixto, :coches, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas)
      expect(parking.PLAZAS_LIBRES).to eq(:plazaslibres)
      conjunto_plazas1 = [@conjunto2, @conjunto3, @conjunto4]
      parking1 = Aparcamiento::Parking.new(3, 4, 312399, "Parking de la ESIT ULL", :cubierto, :guaguas, conjunto_plazas1, [], @conjunto_plazas_ocupadas)
      expect(parking1.PLAZAS_LIBRES).to eq(:sinplazaslibres)
    end

    it "Testeo para el método que devuelve el número de plazas del aparcamiento" do
      expect(Aparcamiento::Parking.new(1, 1, 111111, "Parking del Mercadona", :mixto, :coches, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas).numero_plazas).to eq(4)
      conjunto_plazas1 = [@conjunto1, @conjunto4]
      conjunto_plazas2 = [@conjunto2, @conjunto3, @conjunto4]
      expect(Aparcamiento::Parking.new(1, 1, 111111, "Parking del Mercadona", :mixto, :coches, conjunto_plazas1, @conjunto_plazas_libre, @conjunto_plazas_ocupadas).numero_plazas).to eq(2)
      expect(Aparcamiento::Parking.new(1, 1, 111111, "Parking del Mercadona", :mixto, :coches, conjunto_plazas2, @conjunto_plazas_libre, @conjunto_plazas_ocupadas).numero_plazas).to eq(3)
    end

    it "Testeo para el método que devuelve el numero de plazas libres del aparcamiento" do
      conjunto_plazas1 = [@conjunto1, @conjunto2, @conjunto3, @conjunto4]
      conjunto_plazas2 = [@conjunto1, @conjunto3]
      parking = Aparcamiento::Parking.new(4, 9, 999999, "Parking bolis BIC", :mixto, :coches, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas)
      expect(parking.numero_plazas_libres(conjunto_plazas1)).to eq(2)
      expect(parking.numero_plazas_libres(conjunto_plazas2)).to eq(1)
    end
  end

  describe Aparcamiento::Conjunto do
    it "Inicializar un objeto de la clase Conjunto" do
      expect(Aparcamiento::Conjunto.new(10, 10, 10, :ocupado)).not_to eq(nil)
      conjunto1 = Aparcamiento::Conjunto.new(10, 10, 10, :libre)
      expect(conjunto1).not_to eq(nil)
    end

    it "Testeo de errores para cada parametro" do
      #expect{Aparcamiento::Conjunto.new(-9.0, 2.0, 2.0, :libre)}.not_to raise_error(ArgumentError)
      #expect{Aparcamiento::Conjunto.new(2.0, -9.0, 2.0, :libre)}.not_to raise_error(ArgumentError)
      #expect{Aparcamiento::Conjunto.new(2.0, 2.0, -9.0, :libre)}.not_to raise_error(ArgumentError)
      #expect{Aparcamiento::Conjunto.new(2.0, 2.0, 2.0, :libre)}.not_to raise_error(ArgumentError)
    end
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

  describe Aparcamiento::Motor do
    # Inicializacion de objetos de la clase Motor
    before :all do
      @motor = Aparcamiento::Motor.new(4, 2, 100, 80)
      @motor1 = Aparcamiento::Motor.new(2, 4, 120, 90)
      @motor2 = Aparcamiento::Motor.new(3, 1, 100, 80)
    end

    # Inicializar un objeto, test de errores y expectativas
    context "Inicializar un objeto de la clase Motor, test de errores y expectativas" do
      it "Inicializar un objeto de la clase Motor" do
        # expect(Aparcamiento::Motor.new(2, 4, 125, 180)).not_to eq(nil)
        # yamaha = Aparcamiento::Motor.new(3, 2, 150, 160)
        # expect(yamaha).not_to eq(nil)
        expect(Aparcamiento::Motor).not_to eq(nil)
      end

      it "Testeo de errores para cada parametro" do
        expect{Aparcamiento::Motor.new("2", 4, 125, 180)}.to raise_error(ArgumentError)
        expect{Aparcamiento::Motor.new(2.0, 4, 125, 180)}.to raise_error(ArgumentError)
        expect{Aparcamiento::Motor.new(2, "4", 125, 180)}.to raise_error(ArgumentError)
        expect{Aparcamiento::Motor.new(2, 4.0, 125, 180)}.to raise_error(ArgumentError)
        expect{Aparcamiento::Motor.new(2, 4, "125", 180)}.to raise_error(ArgumentError)
        expect{Aparcamiento::Motor.new(2, 4, 125.0, 180)}.to raise_error(ArgumentError)
        expect{Aparcamiento::Motor.new(2, 4, 125, "180")}.to raise_error(ArgumentError)
        expect{Aparcamiento::Motor.new(2, 4, 125, 180.0)}.to raise_error(ArgumentError)
      end

      it "Testeo de los getters para cada parametro" do
        harley = Aparcamiento::Motor.new(2, 4, 125, 180)
        expect(harley.num_ruedas).to eq(2)
        expect(harley.num_plazas).to eq(4)
        expect(harley.potencia_motor).to eq(125)
        expect(harley.vel_max).to eq(180) 
      end
    end

    # Testeo de los metodos de la clase Motor
    context "Testeo de los métodos de la clase Motor" do
      it "Testeo del to_s" do
        honda = Aparcamiento::Motor.new(2, 4, 125, 180)
        expect(honda.to_s).to eq("El motor con 2 ruedas, con 4 plazas, con una potencia de motor 125 cc, y con una velocidad maxima de 180 km/h")
        expect(@motor.to_s).to eq("El motor con 4 ruedas, con 2 plazas, con una potencia de motor 100 cc, y con una velocidad maxima de 80 km/h")
      end
    end

    # Testeo la de herencia de la clase Motor
    context "Herencia de la clase Motor" do
      it "Testeo de la instancia de la clase Motor sea un Motor" do
        honda = Aparcamiento::Motor.new(2, 4, 125, 180)
        expect(honda.instance_of? Aparcamiento::Motor).to eq(true)
        expect(@motor.instance_of? Aparcamiento::Motor).to eq(true)
      end

      it "Testeo de la instancia de la clase Motor sea un Vehiculo" do
        honda = Aparcamiento::Motor.new(2, 4, 125, 180)
        expect(honda.is_a?Aparcamiento::Vehiculo).to eq(true)
        expect(@motor.is_a?Aparcamiento::Vehiculo).to eq(true)
      end

      it "Testeo de la instancia de la clase Motor sea un Object" do
        honda = Aparcamiento::Motor.new(2, 4, 125, 180)
        expect(honda.is_a?Object).to eq(true)
        expect(@motor.is_a?Object).to eq(true)
      end
      
      it "Testeo de la instancia de la clase Motor sea un BasicObject" do
        honda = Aparcamiento::Motor.new(2, 4, 125, 180)
        expect(honda.is_a?BasicObject).to eq(true)
        expect(@motor.is_a?BasicObject).to eq(true)
      end

      it "Testeo de la instancia de la clase Motor sea un String" do
        honda = Aparcamiento::Motor.new(2, 4, 125, 180)
        expect(honda.is_a?String).to eq(false)
        expect(@motor.is_a?String).to eq(false)
      end

      it "Testeo de la instancia de la clase Motor sea un Numeric" do
        honda = Aparcamiento::Motor.new(2, 4, 125, 180)
        expect(honda.is_a?Numeric).to eq(false)
        expect(@motor.is_a?Numeric).to eq(false)
      end
    end

    # Testeo del modulo Comparable en la clase Motor
    context "Testeo del modulo Comparable" do
      it "Testeo del metodo <" do
        expect(@motor < @motor1).to eq(true)
        expect(@motor1 < @motor).to eq(false)
        expect(@motor < @motor2).to eq(false)
        expect(@motor2 < @motor).to eq(true)
        expect(@motor1 < @motor2).to eq(false)
        expect(@motor2 < @motor1).to eq(true)
      end

      it "Testeo del metodo >" do
        expect(@motor > @motor1).to eq(false)
        expect(@motor1 > @motor).to eq(true)
        expect(@motor > @motor2).to eq(true)
        expect(@motor2 > @motor).to eq(false)
        expect(@motor1 > @motor2).to eq(true)
        expect(@motor2 > @motor1).to eq(false)
      end

      it "Testeo del metodo <=" do
        expect(@motor <= @motor1).to eq(true)
        expect(@motor1 <= @motor).to eq(false)
        expect(@motor <= @motor2).to eq(false)
        expect(@motor2 <= @motor).to eq(true)
        expect(@motor1 <= @motor2).to eq(false)
        expect(@motor2 <= @motor1).to eq(true)
      end

      it "Testeo del metodo >=" do
        expect(@motor >= @motor1).to eq(false)
        expect(@motor1 >= @motor).to eq(true)
        expect(@motor >= @motor2).to eq(true)
        expect(@motor2 >= @motor).to eq(false)
        expect(@motor1 >= @motor2).to eq(true)
        expect(@motor2 >= @motor1).to eq(false)
      end
    end
  end

  describe Aparcamiento::Datos do
    # Inicializacion de objetos para los test
    before :all do
      @conjunto1 = Aparcamiento::Conjunto.new(3.0, 3.0, 2.5, :libre)
      @conjunto2 = Aparcamiento::Conjunto.new(3.0, 3.0, 2.5, :libre)
      @conjunto3 = Aparcamiento::Conjunto.new(3.0, 3.0, 2.5, :ocupado)
      @conjunto4 = Aparcamiento::Conjunto.new(3.0, 3.0, 2.5, :ocupado)
      @conjunto_plazas = [@conjunto1, @conjunto2, @conjunto3, @conjunto4]
      @conjunto_plazas_libre = [@conjunto1, @conjunto2]
      @conjunto_plazas_ocupadas = [@conjunto3, @conjunto4]
    end
    
    # Inicializar un objeto de la clase Datos, test de errores y expectativas
    context "Inicializar un objeto de la clase Datos, test de errores y expectativas" do
      it "Inicializar un objeto de la clase Datos" do
        expect(Aparcamiento::Datos.new(3, 4, 312399, "Parking de la ESIT ULL", :cubierto, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas)).not_to be nil
        expect(Aparcamiento::Datos.new(5, 10, 111111, "Parking del Meridiano", :mixto, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas)).not_to be nil
        parking1 = Aparcamiento::Datos.new(1, 7, 123456, "Parking de la Arepera 23", :airelibre, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas)
        expect(parking1).not_to be nil
      end

      it "Testeo de errores para cada parametro" do
        expect{Aparcamiento::Datos.new(0, 4, 000000 , "Parking de la ESIT ULL", :cubierto, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas)}.to raise_error(ArgumentError)
        expect{Aparcamiento::Datos.new(5, 0, 111111, "Parking del Meridiano", :mixto, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas)}.to raise_error(ArgumentError)
        expect{Aparcamiento::Datos.new(1, 7, "123456", "Parking de la Arepera 23", :airelibre, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas)}.to raise_error(ArgumentError)
        expect{Aparcamiento::Datos.new(1, 7, 1236, "Parking de la Arepera 23", :airelibre, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas)}.to raise_error(ArgumentError)
        expect{Aparcamiento::Datos.new(1, 7, 123456, 00, :airelibre, :motos, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas)}.to raise_error(ArgumentError)
        expect{Aparcamiento::Datos.new(1, 7, 123456, "Parking de la Arepera 23", :fuera, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas)}.to raise_error(ArgumentError)
        expect{Aparcamiento::Datos.new(1, 7, 123456, "Parking de la Arepera 23", :airelibre, 00, [], [])}.to raise_error(ArgumentError)
      end

      it "Testeo de los getters para cada parametro" do
        datos1 = Aparcamiento::Datos.new(1, 7, 123456, "Parking de la Arepera 23", :airelibre, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas)
        expect(datos1.accesibilidad).to eq(1)
        expect(datos1.seguridad).to eq(7)
        expect(datos1.identificacion).to eq(123456)
        expect(datos1.nombre_comercial).to eq("Parking de la Arepera 23")
        expect(datos1.descripcion).to eq(:airelibre)
        expect(datos1.conjunto_plazas).to eq(@conjunto_plazas)
        expect(datos1.conjunto_plazas_libre).to eq(@conjunto_plazas_libre)
        expect(datos1.conjunto_plazas_ocupadas).to eq(@conjunto_plazas_ocupadas)
      end
    end

    # Testeo de los metodos de la clase Datos
    context "Testeo de los metodos de la clase Datos" do
      it "Testeo del metodo to_s" do
        datos1 = Aparcamiento::Datos.new(4, 9, 999999, "Parking bolis BIC", :mixto, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas)
        expect(datos1.to_s).to eq("Los datos del aparcamiento son: Tiene una accesibilidad de: 4, una seguridad de: 9, un identificador de: 999999, un nombre comercial de: Parking bolis BIC, una descripcion de: mixto, un conjunto de plazas de: #{@conjunto_plazas}, un conjunto de plazas libres de: #{@conjunto_plazas_libre}, un conjunto de plazas ocupadas de: #{@conjunto_plazas_ocupadas}")
      end

      it "Testeo del método que devuelve el número de plazas del aparcamiento" do
        expect(Aparcamiento::Datos.new(1, 1, 111111, "Parking del Mercadona", :mixto, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas).numero_plazas).to eq(4)
        conjunto_plazas1 = [@conjunto1, @conjunto4]
        conjunto_plazas2 = [@conjunto2, @conjunto3, @conjunto4]
        expect(Aparcamiento::Datos.new(1, 1, 111111, "Parking del Mercadona", :mixto, conjunto_plazas1, @conjunto_plazas_libre, @conjunto_plazas_ocupadas).numero_plazas).to eq(2)
        expect(Aparcamiento::Datos.new(1, 1, 111111, "Parking del Mercadona", :mixto, conjunto_plazas2, @conjunto_plazas_libre, @conjunto_plazas_ocupadas).numero_plazas).to eq(3)
      end

      it "Testeo del método que devuelve el número de plazas libres del aparcamiento" do
        conjunto_plazas1 = [@conjunto1, @conjunto2, @conjunto3, @conjunto4]
        conjunto_plazas2 = [@conjunto1, @conjunto3]
        datos1 = Aparcamiento::Datos.new(4, 9, 999999, "Parking bolis BIC", :mixto, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas)
        expect(datos1.numero_plazas_libres(conjunto_plazas1)).to eq(2)
        expect(datos1.numero_plazas_libres(conjunto_plazas2)).to eq(1)
      end
    end

    # Testeo de la herencia de la clase Datos 
    context "Herencia de la clase Datos" do
      it "Testeo de la instancia de la clase Datos sean los datos de un aparcamiento" do
        datos1 = Aparcamiento::Datos.new(4, 9, 999999, "Parking bolis BIC", :mixto, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas)
        expect(datos1).to be_an_instance_of(Aparcamiento::Datos)
      end

      it "Testeo de la instancia de clase Datos sea un Object" do
        datos1 = Aparcamiento::Datos.new(4, 9, 999999, "Parking bolis BIC", :mixto, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas)
        expect(datos1.is_a?Object).to eq(true)
      end

      it "Testeo de la instancia de clase Datos sea un BasicObject" do
        datos1 = Aparcamiento::Datos.new(4, 9, 999999, "Parking bolis BIC", :mixto, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas)
        expect(datos1.is_a?BasicObject).to eq(true)
      end

      it "Testeo de la instancia de la clase Datos sea un Vehiculo" do
        datos1 = Aparcamiento::Datos.new(4, 9, 999999, "Parking bolis BIC", :mixto, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas)
        expect(datos1.is_a?Aparcamiento::Vehiculo).to eq(false)
      end

      it "Testeo de la instancia de la clase Datos sea un Motor" do
        datos1 = Aparcamiento::Datos.new(4, 9, 999999, "Parking bolis BIC", :mixto, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas)
        expect(datos1.is_a?Aparcamiento::Motor).to eq(false)
      end
    end
  end
end