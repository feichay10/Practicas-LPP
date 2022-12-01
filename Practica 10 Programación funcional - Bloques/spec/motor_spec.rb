#frozen_string_literal: true

RSpec.describe Aparcamiento do
  it 'has a version number' do
    expect(Aparcamiento::VERSION).not_to be nil
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
end