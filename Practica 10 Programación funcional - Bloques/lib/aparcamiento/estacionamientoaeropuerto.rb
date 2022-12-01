#frozen_string_literal: true

# * estacionamientoaeropuerto.rb
# Autor: Cheuk Kelly Ng Pante
# 
# Clase EstacionamientoAeropuerto
# 
# Definicion de la clase EstacionamientoAeropuerto compuesta por
# 

module Aparcamiento
  class EstacionamientoAeropuerto < Parking
    include FuncionalidadesAparcamiento
    # Getters de los distintos atributos de la clase EstacionamientoAeropuerto
    attr_reader :num_plantas, :distancia, :minusvalidos, :precio, :conjunto_vehiculos
    def initialize(num_plantas, distancia, minusvalidos, precio, conjunto_vehiculos, accesibilidad, seguridad, identificacion, nombre_comercial, descripcion, tipo, conjunto_plazas, conjunto_plazas_libre, conjunto_plazas_ocupadas)
      if num_plantas.is_a? Integer and num_plantas > 0 and num_plantas < 4
        @num_plantas = num_plantas
      else
        raise ArgumentError, 'El numero de plantas debe ser un numero entero mayor que 0 y menor que 4'
      end

      if distancia.is_a? Float and distancia > 0
        @distancia = distancia
      else
        raise ArgumentError, 'La distancia debe ser un numero flotante mayor que 0'
      end

      if minusvalidos.is_a? Integer and minusvalidos > 0
        @minusvalidos = minusvalidos
      else
        raise ArgumentError, 'El numero de plazas para minusvalidos debe ser un numero entero mayor que 0'
      end

      if precio.is_a? Float and precio > 0
        @precio = precio
      else
        raise ArgumentError, 'El precio debe ser un numero flotante mayor que 0'
      end

      if conjunto_vehiculos.is_a? Array
        @conjunto_vehiculos = conjunto_vehiculos
      else
        raise ArgumentError, 'El conjunto de vehiculos debe ser un array'
      end

      # Creacion de objetos relativos a la clase Parking
      super(accesibilidad, seguridad, identificacion, nombre_comercial, descripcion, tipo, conjunto_plazas, conjunto_plazas_libre, conjunto_plazas_ocupadas)
    end
  end
end