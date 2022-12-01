#frozen_string_literal: true

# * estacionamientoestaciontren.rb
# Autor: Cheuk Kelly Ng Pante
# 
# Clase EstacionamientoEstacionTren
# 
# Definicion de la clase EstacionamientoEstacionTren compuesta por
# 

module Aparcamiento
  class EstacionamientoEstacionTren < Parking
    include FuncionalidadesAparcamiento
    # Getters de los distintos atributos de la clase EstacionamientoEstacionTren
    attr_reader :largo_distancia, :distancia, :minusvalidos, :precio, :conjunto_vehiculos
    def initialize(largo_distancia, distancia, minusvalidos, precio, conjunto_vehiculos, accesibilidad, seguridad, identificacion, nombre_comercial, descripcion, tipo, conjunto_plazas, conjunto_plazas_libre, conjunto_plazas_ocupadas)
      if largo_distancia.is_a? Integer and largo_distancia > 0
        @largo_distancia = largo_distancia
      else
        raise ArgumentError, 'El numero de plazas para largo distancia debe ser un numero entero mayor que 0'
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