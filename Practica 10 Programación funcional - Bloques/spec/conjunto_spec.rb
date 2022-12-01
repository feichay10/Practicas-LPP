#frozen_string_literal: true

RSpec.describe Aparcamiento do
  it "has a version number" do
    expect(Aparcamiento::VERSION).not_to be nil
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
end