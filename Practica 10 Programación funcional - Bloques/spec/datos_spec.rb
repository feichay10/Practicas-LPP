#frozen_string_literal: true

RSpec.describe Aparcamiento do
  it 'has a version number' do
    expect(Aparcamiento::VERSION).not_to be nil
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

      @tnfnorte = Aparcamiento::Datos.new(4, 9, 999999, "Parking Tenerife Norte", :mixto, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas, 20.2, 0.1, 2)
      @tnfsur = Aparcamiento::Datos.new(4, 9, 999999, "Parking Tenerife Sur", :mixto, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas, 30.1, 0.4, 2)
      @intersc = Aparcamiento::Datos.new(4, 9, 999999, "Parking Intercambiador SC", :mixto, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas, 42.9, 0.09, 2)
      @interLL = Aparcamiento::Datos.new(4, 9, 999999, "Parking Intercambiador LL", :mixto, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas, 11.5, 0.2, 2)

      # Plazas para minusvalidos
      @conjunto5 = Aparcamiento::Conjunto.new(5.0, 5.0, 2.5, :libre)
      @conjunto6 = Aparcamiento::Conjunto.new(5.0, 5.0, 2.5, :ocupado)
      @conjunto_plazas_minusvalidos = [@conjunto1, @conjunto2, @conjunto3, @conjunto4, @conjunto5, @conjunto6]
      @conjunto_plazas_libre_minusvalidos = [@conjunto1, @conjunto2, @conjunto5]
      @conjunto_plazas_ocupadas_minusvalidos = [@conjunto3, @conjunto4, @conjunto6]

      @esit = Aparcamiento::Datos.new(4, 9, 999999, "Parking ESIT", :mixto, @conjunto_plazas_minusvalidos, @conjunto_plazas_libre_minusvalidos, @conjunto_plazas_ocupadas_minusvalidos, 10.1, 0.51, 2)
      @campuscentral = Aparcamiento::Datos.new(4, 9, 999999, "Parking Campus Central", :mixto, @conjunto_plazas_minusvalidos, @conjunto_plazas_libre_minusvalidos, @conjunto_plazas_ocupadas_minusvalidos, 11.5, 0.2, 2)
      @guajara = Aparcamiento::Datos.new(4, 9, 999999, "Parking Guajara", :mixto, @conjunto_plazas_minusvalidos, @conjunto_plazas_libre_minusvalidos, @conjunto_plazas_ocupadas_minusvalidos, 30.1, 0.4, 2)
      @campusanchieta = Aparcamiento::Datos.new(4, 9, 999999, "Parking Campus Anchieta", :mixto, @conjunto_plazas_minusvalidos, @conjunto_plazas_libre_minusvalidos, @conjunto_plazas_ocupadas_minusvalidos, 42.9, 0.09, 2)

      @arepera23 = Aparcamiento::Datos.new(4, 9, 999999, "Parking Arepera 23", :mixto, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas_minusvalidos, 10.1, 0.51, 2)
      @lilis2 = Aparcamiento::Datos.new(4, 9, 999999, "Parking Lilis 2", :mixto, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas_minusvalidos, 11.5, 0.2, 2)
      @kebabaladdin = Aparcamiento::Datos.new(4, 9, 999999, "Parking Kebab Aladdin", :mixto, @conjunto_plazas, @conjunto_plazas_libre_minusvalidos, @conjunto_plazas_ocupadas_minusvalidos, 30.1, 0.4, 2)
      @bola8 = Aparcamiento::Datos.new(4, 9, 999999, "Parking Bola 8", :mixto, @conjunto_plazas, @conjunto_plazas_libre_minusvalidos, @conjunto_plazas_ocupadas_minusvalidos, 42.9, 0.09, 2)

      @deiland = Aparcamiento::Datos.new(4, 9, 999999, "Parking Deiland", :mixto, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas, 42.9, 0.09, 2)
      @meridiano = Aparcamiento::Datos.new(4, 9, 999999, "Parking Meridiano", :mixto, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas, 10.1, 0.51, 2)
      @openmall = Aparcamiento::Datos.new(4, 9, 999999, "Parking Open Mall", :mixto, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas, 30.1, 0.4, 2)
      @siammall = Aparcamiento::Datos.new(4, 9, 999999, "Parking Siam Mall", :mixto, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas, 11.5, 0.2, 2)
    end
    
    # Inicializar un objeto de la clase Datos, test de errores y expectativas
    context "Inicializar un objeto de la clase Datos, test de errores y expectativas" do
      it "Inicializar un objeto de la clase Datos" do
        expect(Aparcamiento::Datos.new(3, 4, 312399, "Parking de la ESIT ULL", :cubierto, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas, 20.2, 0.1, 0)).not_to be nil
        expect(Aparcamiento::Datos.new(5, 10, 111111, "Parking del Meridiano", :mixto, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas, 20.2, 0.1, 2)).not_to be nil
        parking1 = Aparcamiento::Datos.new(1, 7, 123456, "Parking de la Arepera 23", :airelibre, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas, 20.2, 0.1, 2)
        expect(parking1).not_to be nil
      end

      it "Testeo de errores para cada parametro" do
        expect{Aparcamiento::Datos.new(0, 4, 000000 , "Parking de la ESIT ULL", :cubierto, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas, 20.2, 0.1, 2)}.to raise_error(ArgumentError)
        expect{Aparcamiento::Datos.new(5, 0, 111111, "Parking del Meridiano", :mixto, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas, 20.2, 0.1, 2)}.to raise_error(ArgumentError)
        expect{Aparcamiento::Datos.new(1, 7, "123456", "Parking de la Arepera 23", :airelibre, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas, 20.2, 0.1, 2)}.to raise_error(ArgumentError)
        expect{Aparcamiento::Datos.new(1, 7, 1236, "Parking de la Arepera 23", :airelibre, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas, 20.2, 0.1, 2)}.to raise_error(ArgumentError)
        expect{Aparcamiento::Datos.new(1, 7, 123456, 00, :airelibre, :motos, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas, 20.2, 0.1, 2)}.to raise_error(ArgumentError)
        expect{Aparcamiento::Datos.new(1, 7, 123456, "Parking de la Arepera 23", :fuera, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas, 20.2, 0.1, 2)}.to raise_error(ArgumentError)
        expect{Aparcamiento::Datos.new(1, 7, 123456, "Parking de la Arepera 23", :airelibre, 00, [], [], 20.2, 0.1, 2)}.to raise_error(ArgumentError)
      end

      it "Testeo de los getters para cada parametro" do
        datos1 = Aparcamiento::Datos.new(1, 7, 123456, "Parking de la Arepera 23", :airelibre, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas, 20.2, 0.1, 2)
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
        datos1 = Aparcamiento::Datos.new(4, 9, 999999, "Parking bolis BIC", :mixto, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas, 20.2, 0.1, 2)
        expect(datos1.to_s).to eq("Los datos del aparcamiento son: Tiene una accesibilidad de: 4, una seguridad de: 9, un identificador de: 999999, un nombre comercial de: Parking bolis BIC, una descripcion de: mixto, un conjunto de plazas de: #{@conjunto_plazas}, un conjunto de plazas libres de: #{@conjunto_plazas_libre}, un conjunto de plazas ocupadas de: #{@conjunto_plazas_ocupadas}")
      end

      it "Testeo del método que devuelve el número de plazas del aparcamiento" do
        expect(Aparcamiento::Datos.new(1, 1, 111111, "Parking del Mercadona", :mixto, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas, 20.2, 0.1, 2).numero_plazas).to eq(4)
        conjunto_plazas1 = [@conjunto1, @conjunto4]
        conjunto_plazas2 = [@conjunto2, @conjunto3, @conjunto4]
        expect(Aparcamiento::Datos.new(1, 1, 111111, "Parking del Mercadona", :mixto, conjunto_plazas1, @conjunto_plazas_libre, @conjunto_plazas_ocupadas, 20.2, 0.1, 2).numero_plazas).to eq(2)
        expect(Aparcamiento::Datos.new(1, 1, 111111, "Parking del Mercadona", :mixto, conjunto_plazas2, @conjunto_plazas_libre, @conjunto_plazas_ocupadas, 20.2, 0.1, 2).numero_plazas).to eq(3)
      end

      it "Testeo del método que devuelve el número de plazas libres del aparcamiento" do
        conjunto_plazas1 = [@conjunto1, @conjunto2, @conjunto3, @conjunto4]
        conjunto_plazas2 = [@conjunto1, @conjunto3]
        datos1 = Aparcamiento::Datos.new(4, 9, 999999, "Parking bolis BIC", :mixto, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas, 20.2, 0.1, 2)
        expect(datos1.numero_plazas_libres(conjunto_plazas1)).to eq(2)
        expect(datos1.numero_plazas_libres(conjunto_plazas2)).to eq(1)
      end

      it "Testeo del método indice_sostenibilidad" do
        conjunto_plazas1 = [@conjunto1, @conjunto2, @conjunto3, @conjunto4]
        conjunto_plazas2 = [@conjunto1, @conjunto3]
        expect(Aparcamiento::Datos.new(1, 1, 111111, "Parking del Mercadona", :mixto, conjunto_plazas2, @conjunto_plazas_libre, @conjunto_plazas_ocupadas, 19.7, 0.6, 2).indice_sostenibilidad).to eq(1)
        expect(Aparcamiento::Datos.new(1, 1, 111111, "Parking del Mercadona", :mixto, conjunto_plazas2, @conjunto_plazas_libre, @conjunto_plazas_ocupadas, 35.7, 0.2, 2).indice_sostenibilidad).to eq(2)
        expect(Aparcamiento::Datos.new(3, 10, 222222, "Parking de la ULL", :mixto, conjunto_plazas1, @conjunto_plazas_libre, @conjunto_plazas_ocupadas, 53.2, 0.05, 2).indice_sostenibilidad).to eq(3)
      end
    end

    # Testeo de la herencia de la clase Datos 
    context "Herencia de la clase Datos" do
      it "Testeo de la instancia de la clase Datos sean los datos de un aparcamiento" do
        datos1 = Aparcamiento::Datos.new(4, 9, 999999, "Parking bolis BIC", :mixto, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas, 20.2, 0.1, 2)
        expect(datos1).to be_an_instance_of(Aparcamiento::Datos)
      end

      it "Testeo de la instancia de clase Datos sea un Object" do
        datos1 = Aparcamiento::Datos.new(4, 9, 999999, "Parking bolis BIC", :mixto, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas, 20.2, 0.1, 2)
        expect(datos1.is_a?Object).to eq(true)
      end

      it "Testeo de la instancia de clase Datos sea un BasicObject" do
        datos1 = Aparcamiento::Datos.new(4, 9, 999999, "Parking bolis BIC", :mixto, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas, 20.2, 0.1, 2)
        expect(datos1.is_a?BasicObject).to eq(true)
      end

      it "Testeo de la instancia de la clase Datos sea un Vehiculo" do
        datos1 = Aparcamiento::Datos.new(4, 9, 999999, "Parking bolis BIC", :mixto, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas, 20.2, 0.1, 2)
        expect(datos1.is_a?Aparcamiento::Vehiculo).to eq(false)
      end

      it "Testeo de la instancia de la clase Datos sea un Motor" do
        datos1 = Aparcamiento::Datos.new(4, 9, 999999, "Parking bolis BIC", :mixto, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas, 20.2, 0.1, 2)
        expect(datos1.is_a?Aparcamiento::Motor).to eq(false)
      end
    end

    context "Testeo para la un conjunto de aparcamientos publicos de una ciudad" do 
      it "Testeo para seleccionar el estacionamiento con plazas libres que tiene mayor indice de sostenibilidad" do
        estacionamiento1 = [@tnfnorte, @tnfsur, @intersc, @interLL]
        parking1 = Aparcamiento::Datos.new(1, 1, 111111, "Parking 1", :mixto, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas, 20.2, 0.1, 0)
        parking2 = Aparcamiento::Datos.new(2, 2, 222222, "Parking 2", :mixto, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas, 36.9, 0.31, 0)
        parking3 = Aparcamiento::Datos.new(3, 3, 333333, "Parking 3", :mixto, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas, 87.0, 0.03, 0)
        parking4 = Aparcamiento::Datos.new(4, 4, 444444, "Parking 4", :mixto, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas, 10.1, 0.78, 0)
        estacionamiento2 = [parking1, parking2, parking3, parking4]
        estacionamiento3 = [@tnfnorte, @tnfsur, @intersc, @interLL, parking1, parking2, parking3, parking4]
        estacionamiento4 = [@esit, @campuscentral, @tnfnorte, @tnfsur, parking1, parking2]
        estacionamiento5 = [@arepera23, @lilis2, @kebabaladdin, @esit, @campuscentral, @tnfnorte, @tnfsur, parking1, parking4]
        estacionamiento6 = [@deiland, @meridiano, @openmall, @siammall, parking2, parking3]
        estacionamiento7 = [@arepera23, @lilis2, @kebabaladdin, @esit, @campuscentral, @tnfnorte, @tnfsur, parking1, parking2, parking3, parking4]
        estacionamiento8 = [@deiland, @meridiano, @openmall, @siammall, parking2, parking3, parking4]
        estacionamiento9 = [@arepera23, @lilis2, @kebabaladdin, @esit, @campuscentral, @tnfnorte, @tnfsur, parking1, parking2, parking3, parking4, parking1, parking2, parking3, parking4]
        estacionamiento10 = [@deiland, @meridiano, @openmall, @siammall, parking2, parking3, parking4, parking1, parking2, parking3, parking4]
        expect(estacionamiento1.select{|x| (x.conjunto_plazas_libre.length > 0)}.max).to eq(@intersc)
        expect(estacionamiento2.select{|x| (x.conjunto_plazas_libre.length > 0)}.max).to eq(parking3)
        expect(estacionamiento3.select{|x| (x.conjunto_plazas_libre.length > 0)}.max).to eq(parking3)
        expect(estacionamiento4.select{|x| (x.conjunto_plazas_libre.length > 0)}.max).to eq(@tnfsur)
        expect(estacionamiento5.select{|x| (x.conjunto_plazas_libre.length > 0)}.max).to eq(@tnfsur)
        expect(estacionamiento6.select{|x| (x.conjunto_plazas_libre.length > 0)}.max).to eq(parking3)
        expect(estacionamiento7.select{|x| (x.conjunto_plazas_libre.length > 0)}.max).to eq(parking3)
        expect(estacionamiento8.select{|x| (x.conjunto_plazas_libre.length > 0)}.max).to eq(parking3)
        expect(estacionamiento9.select{|x| (x.conjunto_plazas_libre.length > 0)}.max).to eq(parking3)
        expect(estacionamiento10.select{|x| (x.conjunto_plazas_libre.length > 0)}.max).to eq(parking3)
      end

      it "Testeo para seleccionar el estacionamiento con plazas de minusvalidos libres que tiene mayor indice de sostenibilidad" do
        estacionamiento1 = [@esit, @campuscentral, @guajara, @campusanchieta]
        parking1 = Aparcamiento::Datos.new(1, 1, 111111, "Parking 1", :mixto, @conjunto_plazas_minusvalidos, @conjunto_plazas_libre_minusvalidos, @conjunto_plazas_ocupadas_minusvalidos, 20.2, 0.1, 2)
        parking2 = Aparcamiento::Datos.new(2, 2, 222222, "Parking 2", :mixto, @conjunto_plazas_minusvalidos, @conjunto_plazas_libre_minusvalidos, @conjunto_plazas_ocupadas_minusvalidos, 36.9, 0.31, 2)
        parking3 = Aparcamiento::Datos.new(3, 3, 333333, "Parking 3", :mixto, @conjunto_plazas_minusvalidos, @conjunto_plazas_libre_minusvalidos, @conjunto_plazas_ocupadas_minusvalidos, 87.0, 0.03, 2)
        parking4 = Aparcamiento::Datos.new(4, 4, 444444, "Parking 4", :mixto, @conjunto_plazas_minusvalidos, @conjunto_plazas_libre_minusvalidos, @conjunto_plazas_ocupadas_minusvalidos, 10.1, 0.78, 2)
        estacionamiento2 = [parking1, parking2, parking3, parking4]
        estacionamiento3 = [@tnfnorte, @tnfsur, @intersc, @interLL, parking1, parking2, parking3, parking4]
        estacionamiento4 = [@esit, @campuscentral, @tnfnorte, @tnfsur, parking1, parking2]
        estacionamiento5 = [@arepera23, @lilis2, @kebabaladdin, @esit, @campuscentral, @tnfnorte, @tnfsur, parking1, parking4]
        estacionamiento6 = [@deiland, @meridiano, @openmall, @siammall, parking2, parking3]
        estacionamiento7 = [@arepera23, @lilis2, @kebabaladdin, @esit, @campuscentral, @tnfnorte, @tnfsur, parking1, parking2, parking3, parking4]
        estacionamiento8 = [@deiland, @meridiano, @openmall, @siammall, parking2, parking3, parking4]
        estacionamiento9 = [@arepera23, @lilis2, @kebabaladdin, @esit, @campuscentral, @tnfnorte, @tnfsur, parking1, parking2, parking3, parking4, parking1, parking2, parking3, parking4]
        estacionamiento10 = [@deiland, @meridiano, @openmall, @siammall, parking2, parking3, parking4, parking1, parking2, parking3, parking4]
        expect(estacionamiento1.select{|x| (x.num_minusvalidos > 0)}.max).to eq(@campusanchieta)
        expect(estacionamiento2.select{|x| (x.num_minusvalidos > 0)}.max).to eq(parking3)
        expect(estacionamiento3.select{|x| (x.num_minusvalidos > 0)}.max).to eq(parking3)
        expect(estacionamiento4.select{|x| (x.num_minusvalidos > 0)}.max).to eq(@tnfsur)
        expect(estacionamiento5.select{|x| (x.num_minusvalidos > 0)}.max).to eq(@tnfsur)
        expect(estacionamiento6.select{|x| (x.num_minusvalidos > 0)}.max).to eq(parking3)
        expect(estacionamiento7.select{|x| (x.num_minusvalidos > 0)}.max).to eq(parking3)
        expect(estacionamiento8.select{|x| (x.num_minusvalidos > 0)}.max).to eq(parking3)
        expect(estacionamiento9.select{|x| (x.num_minusvalidos > 0)}.max).to eq(parking3)
        expect(estacionamiento10.select{|x| (x.num_minusvalidos > 0)}.max).to eq(parking3)
      end

      it "Testeo que calcula el porcentaje de ocupacion de cada uno de ellos" do
        estacionamiento1 = [@arepera23, @lilis2, @kebabaladdin, @bola8]
        parking1 = Aparcamiento::Datos.new(1, 1, 111111, "Parking 1", :mixto, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas, 20.2, 0.1, 0)
        parking2 = Aparcamiento::Datos.new(2, 2, 222222, "Parking 2", :mixto, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas, 36.9, 0.31, 0)
        parking3 = Aparcamiento::Datos.new(3, 3, 333333, "Parking 3", :mixto, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas, 87.0, 0.03, 0)
        parking4 = Aparcamiento::Datos.new(4, 4, 444444, "Parking 4", :mixto, @conjunto_plazas, @conjunto_plazas_libre, @conjunto_plazas_ocupadas, 10.1, 0.78, 0)
        estacionamiento2 = [parking1, parking2, parking3, parking4]
        estacionamiento3 = [@tnfnorte, @tnfsur, @intersc, @interLL, parking1, parking2, parking3, parking4]
        estacionamiento4 = [@esit, @campuscentral, @tnfnorte, @tnfsur, parking1, parking2]
        estacionamiento5 = [@arepera23, @lilis2, @kebabaladdin, @esit, @campuscentral, @tnfnorte, @tnfsur, parking1, parking4]
        estacionamiento6 = [@deiland, @meridiano, @openmall, @siammall, parking2, parking3]
        estacionamiento7 = [@arepera23, @lilis2, @kebabaladdin, @esit, @campuscentral, @tnfnorte, @tnfsur, parking1, parking2, parking3, parking4]
        estacionamiento8 = [@deiland, @meridiano, @openmall, @siammall, parking2, parking3, parking4]
        estacionamiento9 = [@arepera23, @lilis2, @kebabaladdin, @esit, @campuscentral, @tnfnorte, @tnfsur, parking1, parking2, parking3, parking4, parking1, parking2, parking3, parking4]
        estacionamiento10 = [@deiland, @meridiano, @openmall, @siammall, parking2, parking3, parking4, parking1, parking2, parking3, parking4]
        expect(estacionamiento1.map{|x| (x.conjunto_plazas_ocupadas.length.to_f / x.conjunto_plazas.length.to_f) * 100}).to eq([75.0, 75.0, 75.0, 75.0])
        expect(estacionamiento2.map{|x| (x.conjunto_plazas_ocupadas.length.to_f / x.conjunto_plazas.length.to_f) * 100}).to eq([50.0, 50.0, 50.0, 50.0])
        expect(estacionamiento3.map{|x| (x.conjunto_plazas_ocupadas.length.to_f / x.conjunto_plazas.length.to_f) * 100}).to eq([50.0, 50.0, 50.0, 50.0, 50.0, 50.0, 50.0, 50.0])
        expect(estacionamiento4.map{|x| (x.conjunto_plazas_ocupadas.length.to_f / x.conjunto_plazas.length.to_f) * 100}).to eq([50.0, 50.0, 50.0, 50.0, 50.0, 50.0])
        expect(estacionamiento5.map{|x| (x.conjunto_plazas_ocupadas.length.to_f / x.conjunto_plazas.length.to_f) * 100}).to eq([75.0, 75.0, 75.0, 50.0, 50.0, 50.0, 50.0, 50.0, 50.0])
        expect(estacionamiento6.map{|x| (x.conjunto_plazas_ocupadas.length.to_f / x.conjunto_plazas.length.to_f) * 100}).to eq([50.0, 50.0, 50.0, 50.0, 50.0, 50.0])
        expect(estacionamiento7.map{|x| (x.conjunto_plazas_ocupadas.length.to_f / x.conjunto_plazas.length.to_f) * 100}).to eq([75.0, 75.0, 75.0, 50.0, 50.0, 50.0, 50.0, 50.0, 50.0, 50.0, 50.0])
        expect(estacionamiento8.map{|x| (x.conjunto_plazas_ocupadas.length.to_f / x.conjunto_plazas.length.to_f) * 100}).to eq([50.0, 50.0, 50.0, 50.0, 50.0, 50.0, 50.0])
        expect(estacionamiento9.map{|x| (x.conjunto_plazas_ocupadas.length.to_f / x.conjunto_plazas.length.to_f) * 100}).to eq([75.0, 75.0, 75.0, 50.0, 50.0, 50.0, 50.0, 50.0, 50.0, 50.0, 50.0, 50.0, 50.0, 50.0, 50.0])
        expect(estacionamiento10.map{|x| (x.conjunto_plazas_ocupadas.length.to_f / x.conjunto_plazas.length.to_f) * 100}).to eq([50.0, 50.0, 50.0, 50.0, 50.0, 50.0, 50.0, 50.0, 50.0, 50.0, 50.0])
      end

      it "Testeo que calcula el porcentaje de plazas de minusvalidos libres de cada uno de ellos" do
        estacionamiento1 = [@deiland, @meridiano, @openmall, @siammall]
        parking1 = Aparcamiento::Datos.new(1, 1, 111111, "Parking 1", :mixto, @conjunto_plazas_minusvalidos, @conjunto_plazas_libre_minusvalidos, @conjunto_plazas_ocupadas_minusvalidos, 20.2, 0.1, 2)
        parking2 = Aparcamiento::Datos.new(2, 2, 222222, "Parking 2", :mixto, @conjunto_plazas_minusvalidos, @conjunto_plazas_libre_minusvalidos, @conjunto_plazas_ocupadas_minusvalidos, 36.9, 0.31, 2)
        parking3 = Aparcamiento::Datos.new(3, 3, 333333, "Parking 3", :mixto, @conjunto_plazas_minusvalidos, @conjunto_plazas_libre_minusvalidos, @conjunto_plazas_ocupadas_minusvalidos, 87.0, 0.03, 2)
        parking4 = Aparcamiento::Datos.new(4, 4, 444444, "Parking 4", :mixto, @conjunto_plazas_minusvalidos, @conjunto_plazas_libre_minusvalidos, @conjunto_plazas_ocupadas_minusvalidos, 10.1, 0.78, 2)
        estacionamiento2 = [parking1, parking2, parking3, parking4]
        estacionamiento3 = [@tnfnorte, @tnfsur, @intersc, @interLL, parking1, parking2, parking3, parking4]
        estacionamiento4 = [@esit, @campuscentral, @tnfnorte, @tnfsur, parking1, parking2]
        estacionamiento5 = [@arepera23, @lilis2, @kebabaladdin, @esit, @campuscentral, @tnfnorte, @tnfsur, parking1, parking4]
        estacionamiento6 = [@deiland, @meridiano, @openmall, @siammall, parking2, parking3]
        estacionamiento7 = [@arepera23, @lilis2, @kebabaladdin, @esit, @campuscentral, @tnfnorte, @tnfsur, parking1, parking2, parking3, parking4]
        estacionamiento8 = [@deiland, @meridiano, @openmall, @siammall, parking2, parking3, parking4]
        estacionamiento9 = [@arepera23, @lilis2, @kebabaladdin, @esit, @campuscentral, @tnfnorte, @tnfsur, parking1, parking2, parking3, parking4, parking1, parking2, parking3, parking4]
        estacionamiento10 = [@deiland, @meridiano, @openmall, @siammall, parking2, parking3, parking4, parking1, parking2, parking3, parking4]
        expect(estacionamiento1.map{|x| (x.num_minusvalidos.to_f / x.conjunto_plazas.length.to_f) * 100}).to eq([50.0, 50.0, 50.0, 50.0])
        expect(estacionamiento2.map{|x| (x.num_minusvalidos.to_f / x.conjunto_plazas.length.to_f) * 100}).to eq([33.33333333333333, 33.33333333333333, 33.33333333333333, 33.33333333333333])
        expect(estacionamiento3.map{|x| (x.num_minusvalidos.to_f / x.conjunto_plazas.length.to_f) * 100}).to eq([50.0, 50.0, 50.0, 50.0, 33.33333333333333, 33.33333333333333, 33.33333333333333, 33.33333333333333])
        expect(estacionamiento4.map{|x| (x.num_minusvalidos.to_f / x.conjunto_plazas.length.to_f) * 100}).to eq([33.33333333333333, 33.33333333333333, 50.0, 50.0, 33.33333333333333, 33.33333333333333])
        expect(estacionamiento5.map{|x| (x.num_minusvalidos.to_f / x.conjunto_plazas.length.to_f) * 100}).to eq([50.0, 50.0, 50.0, 33.33333333333333, 33.33333333333333, 50.0, 50.0, 33.33333333333333, 33.33333333333333])
        expect(estacionamiento6.map{|x| (x.num_minusvalidos.to_f / x.conjunto_plazas.length.to_f) * 100}).to eq([50.0, 50.0, 50.0, 50.0, 33.33333333333333, 33.33333333333333])
        expect(estacionamiento7.map{|x| (x.num_minusvalidos.to_f / x.conjunto_plazas.length.to_f) * 100}).to eq([50.0, 50.0, 50.0, 33.33333333333333, 33.33333333333333, 50.0, 50.0, 33.33333333333333, 33.33333333333333, 33.33333333333333, 33.33333333333333])
        expect(estacionamiento8.map{|x| (x.num_minusvalidos.to_f / x.conjunto_plazas.length.to_f) * 100}).to eq([50.0, 50.0, 50.0, 50.0, 33.33333333333333, 33.33333333333333, 33.33333333333333])
        expect(estacionamiento9.map{|x| (x.num_minusvalidos.to_f / x.conjunto_plazas.length.to_f) * 100}).to eq([50.0, 50.0, 50.0, 33.33333333333333, 33.33333333333333, 50.0, 50.0, 33.33333333333333, 33.33333333333333, 33.33333333333333, 33.33333333333333, 33.33333333333333, 33.33333333333333, 33.33333333333333, 33.33333333333333])
        expect(estacionamiento10.map{|x| (x.num_minusvalidos.to_f / x.conjunto_plazas.length.to_f) * 100}).to eq([50.0, 50.0, 50.0, 50.0, 33.33333333333333, 33.33333333333333, 33.33333333333333, 33.33333333333333, 33.33333333333333, 33.33333333333333, 33.33333333333333])
      end
    end

    context "Testeo del modulo Comparable" do
      it "Testeo del metodo <" do
        expect(@tnfnorte < @tnfsur).to eq(true)
        expect(@tnfsur < @tnfnorte).to eq(false)
        expect(@interLL < @intersc).to eq(true)
        expect(@intersc < @interLL).to eq(false)
        expect(@campuscentral < @esit).to eq(true)
        expect(@esit < @campuscentral).to eq(false)
      end

      it "Testeo del metodo >" do
        expect(@tnfnorte > @tnfsur).to eq(false)
        expect(@tnfsur > @tnfnorte).to eq(true)
        expect(@interLL > @intersc).to eq(false)
        expect(@intersc > @interLL).to eq(true)
        expect(@campuscentral > @esit).to eq(false)
        expect(@esit > @campuscentral).to eq(true)
      end

      it "Testeo del metodo <=" do
        expect(@tnfnorte <= @tnfsur).to eq(true)
        expect(@tnfsur <= @tnfnorte).to eq(false)
        expect(@interLL <= @intersc).to eq(true)
        expect(@intersc <= @interLL).to eq(false)
        expect(@campuscentral <= @esit).to eq(true)
        expect(@esit <= @campuscentral).to eq(false)
      end

      it "Testeo del metodo >=" do
        expect(@tnfnorte >= @tnfsur).to eq(false)
        expect(@tnfsur >= @tnfnorte).to eq(true)
        expect(@interLL >= @intersc).to eq(false)
        expect(@intersc >= @interLL).to eq(true)
        expect(@campuscentral >= @esit).to eq(false)
        expect(@esit >= @campuscentral).to eq(true)
      end
    end
  end
end