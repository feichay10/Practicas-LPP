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
end