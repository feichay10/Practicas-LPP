#frozen_string_literal: true

# * vehiculo.rb
# Autor: Cheuk Kelly Ng Pante
# 
# Clase Vehiculo
# 
# Definicion de la clase Vehiculo compuesta por
# * metodo initialize
# * metodo to_s
# * metodo <=>
# * metodo each

module Aparcamiento
  # Clase Vehiculo
  class Vehiculo
    include Comparable, Enumerable
    # Getters de los distintos atributos de la clase Vehiculo
    attr_reader :identificacion, :altura, :ancho, :largo, :peso
    def initialize(identificacion, altura, ancho, largo, peso)
      if identificacion.is_a? String and identificacion.length == 7
        @identificacion = identificacion
      else
        raise ArgumentError, 'La identificacion debe ser un String y tener 7 caracteres'
      end

      if altura.is_a? Float and altura > 0
        @altura = altura
      else
        raise ArgumentError, 'La altura debe ser un numero flotante mayor que 0'
      end

      if ancho.is_a? Float and ancho > 0
        @ancho = ancho
      else
        raise ArgumentError, 'El ancho debe ser un numero flotante mayor que 0'
      end

      if largo.is_a? Float and largo > 0
        @largo = largo
      else
        raise ArgumentError, 'El largo debe ser un numero flotante mayor que 0'
      end

      if peso.is_a? Integer and peso > 0
        @peso = peso
      else
        raise ArgumentError, 'El peso debe ser un numero entero mayor que 0'
      end

      # Incrementamos el numero de objetos de la clase Vehiculo en 1
      # cada vez que se crea un objeto de la clase Vehiculo
      if defined?(@@numero_objetos)
        @@numero_objetos += 1
      else
        @@numero_objetos = 1
      end
    end

    # Metodo to_s
    # Devuelve un string con la informacion del vehiculo
    # * Argumentos:
    #   - Ninguno
    # * Return:
    #   - String con la informacion del vehiculo
    def to_s
      return "El vehiculo con identificador: #{identificacion}, con altura: #{altura}, anchura: #{ancho}, largo: #{largo}, y con peso en toneladas: #{peso}"
    end

    # Metodo self.numero_objetos
    # Devuelve el numero de objetos de la clase Vehiculo
    # * Argumentos:
    #   - Ninguno
    # * Return:
    #   - Integer con el numero de objetos de la clase Vehiculo
    def self.numero_objetos
      @@numero_objetos
    end

    # Metodo <=>
    # Compara dos objetos de la clase Vehiculo
    # * Argumentos:
    #   - other: Objeto de la clase Vehiculo
    # * Return:
    #   - Integer con el resultado de la comparacion
    def <=>(other)
      @altura * @ancho * @largo <=> other.altura * other.ancho * other.largo
    end

    # Metodo each
    # Itera sobre los atributos de la clase Vehiculo
    # * Argumentos:
    #   - Ninguno
    # * Return:
    #   - Ninguno
    def each
      yield @identificacion
      yield @altura
      yield @ancho
      yield @largo
      yield @peso
    end
  end
end