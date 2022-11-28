#frozen_string_literal: true

# * motor.rb
# Autor: Cheuk Kelly Ng Pante
# 
# Clase Motor
# 
# Definicion de la clase Motor compuesta por
# * metodo initialize
# * metodo to_s
# * metodo <=>

module Aparcamiento
  # Clase Motor
  class Motor < Vehiculo
    include Comparable
    # Getters de los distintos atributos de la clase Motor
    attr_reader :num_ruedas, :num_plazas, :potencia_motor, :vel_max
    def initialize(num_ruedas, num_plazas, potencia_motor, vel_max)
      if num_ruedas.is_a? Integer and num_ruedas > 0
        @num_ruedas = num_ruedas
      else
        raise ArgumentError, 'El numero de ruedas debe ser un numero entero mayor que 0'
      end

      if num_plazas.is_a? Integer and num_plazas > 0
        @num_plazas = num_plazas
      else
        raise ArgumentError, 'El numero de plazas debe ser un numero entero mayor que 0'
      end

      if potencia_motor.is_a? Integer and potencia_motor > 0
        @potencia_motor = potencia_motor
      else
        raise ArgumentError, 'La potencia del motor debe ser un numero entero mayor que 0'
      end

      if vel_max.is_a? Integer and vel_max > 0
        @vel_max = vel_max
      else
        raise ArgumentError, 'La velocidad maxima debe ser un numero entero mayor que 0'
      end
    end

    # Metodo to_s
    # Devuelve un string con la informacion del motor
    # * Argumentos:
    #   - Ninguno
    # * Return:
    #   - String con la informacion del motor
    def to_s
      return "El motor con #{num_ruedas} ruedas, con #{num_plazas} plazas, con una potencia de motor #{potencia_motor} cc, y con una velocidad maxima de #{vel_max} km/h"
    end

    # Metodo <=>
    # Compara dos objetos de la clase Motor
    # * Argumentos:
    #   - other: Objeto de la clase Motor
    # * Return:
    #  - 1 si el numero de plazas del motor es mayor que el del otro motor
    def <=>(other)
      @num_plazas <=> other.num_plazas
    end
  end
end