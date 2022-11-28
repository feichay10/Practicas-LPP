#frozen_string_literal: true

# Fichero que contiene la implementacion de la clase Conjunto
# Contiene los datos de las distintas plazas del aparcamiento
# de las plazas, numero de plazas, nombre del parking, etc.

module Aparcamiento
  # Clase Conjunto
  class Conjunto
    # Getters de los distintos atributos de la clase Conjunto
    attr_reader :altura, :longitud, :anchura, :estado_plazas
    def initialize(altura, longitud, anchura, estado_plazas)
      # Comprobacion de errores de los parametros de la clase
      if altura <= 0 and altura.is_a? Float 
        raise ArgumentError, "La altura debe ser un número flotante mayor que 0"
      else
        @altura = altura
      end
      
      if longitud <= 0 and longitud.is_a? Float
        raise ArgumentError, "La longitud debe ser un número flotante mayor que 0"
      else
        @longitud = longitud
      end

      if anchura <= 0 and anchura.is_a? Float
        raise ArgumentError, "La anchura debe ser un número flotante mayor que 0"
      else
        @anchura = anchura
      end

      if estado_plazas != :ocupado and estado_plazas != :libre
        raise ArgumentError, "El estado de la plaza debe ser ocupado o libre"
      else
        @estado_plazas = estado_plazas
      end
    end

    def to_s 
      return "Conjunto: #{@altura}, #{@longitud}, #{@anchura}, #{@estado_plazas}"
    end
  end
end