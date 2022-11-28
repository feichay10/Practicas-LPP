#frozen_string_literal: true
# Fichero que contiene la implementacion de la clase Parking
# Contiene los datos de un parking como son el estado de ocupacion
# de las plazas, numero de plazas, nombre del parking, etc.

module Aparcamiento
  # Clase Parking
  class Parking
    include Funciones
    # Getters de los distintos atributos de la clase Parking
    attr_reader :accesibilidad, :seguridad, :identificacion, :nombre_comercial, :descripcion, :tipo, :conjunto_plazas, :conjunto_plazas_libre, :conjunto_plazas_ocupadas, :PLAZAS_LLENA, :PLAZAS_LIBRES
    # Constructor de la clase Parking
    def initialize(accesibilidad, seguridad, identificacion, nombre_comercial, descripcion, tipo, conjunto_plazas, conjunto_plazas_libre, conjunto_plazas_ocupadas)
      # Comprobacion de errores de los parametros de la clase
      if accesibilidad < 1 || accesibilidad > 5
        raise ArgumentError, "La accesibilidad debe ser un numero entre 1 y 5"
      else
        @accesibilidad = accesibilidad
      end

      if seguridad < 1 || seguridad > 10
        raise ArgumentError, "La seguridad debe ser un numero entre 1 y 10"
      else
        @seguridad = seguridad
      end

      if identificacion.is_a? Integer and identificacion.to_s.length == 6 and identificacion > 0
        @identificacion = identificacion
      else
        raise ArgumentError, "La identificacion debe ser un numero positivo de 6 digitos"
      end

      if nombre_comercial.is_a? String and nombre_comercial.length > 0
        @nombre_comercial = nombre_comercial
      else
        raise ArgumentError, "El nombre comercial debe ser una String"
      end

      if descripcion != :cubierto and descripcion != :airelibre and descripcion != :mixto
        raise ArgumentError, "La descripcion debe ser cubierto, airelibre o mixto"
      else
        @descripcion = descripcion
      end

      if tipo != :guaguas and tipo != :bicicletas and tipo != :coches and tipo != :motos
        raise ArgumentError, "El tipo debe ser guaguas, bicicletas, coches o motos"
      else
        @tipo = tipo
      end

      if conjunto_plazas.is_a? Array
        @conjunto_plazas = conjunto_plazas
      else
        raise ArgumentError, "El conjunto de plazas debe ser un Array"
      end

      if conjunto_plazas_libre.is_a? Array
        @conjunto_plazas_libre = conjunto_plazas_libre
      else
        raise ArgumentError, "El conjunto de plazas libres debe ser un Array"
      end

      if conjunto_plazas_ocupadas.is_a? Array
        @conjunto_plazas_ocupadas = conjunto_plazas_ocupadas
      else
        raise ArgumentError, "El conjunto de plazas ocupadas debe ser un Array"
      end

      resultado = @conjunto_plazas.length - @conjunto_plazas_ocupadas.length
      if resultado != 0
        @PLAZAS_LLENA = :plazaslibres
      else
        @PLAZAS_LLENA = :plazasocupadas
      end

      if conjunto_plazas_libre.length != 0
        @PLAZAS_LIBRES = :plazaslibres
      else
        @PLAZAS_LIBRES = :sinplazaslibres
      end

      # Este método devuelve el número total de plazas que hay en el aparcamiento
      def numero_plazas
        return @conjunto_plazas.length
      end

      # Este método devuelve el número de plazas libres en el aparcamiento
      def numero_plazas_libres(conjunto_plazas)
        contador = 0
        for plaza in conjunto_plazas
          if plaza.estado_plazas == :libre
            contador = contador + 1
          end
        end
        return contador
      end

      def to_s 
        return "(Aparcamiento: #{@nombre_comercial}, #{@identificacion}, #{@tipo}, #{@descripcion}, #{@seguridad}, #{@accesibilidad}, #{@PLAZAS_LLENA}, #{@PLAZAS_LIBRES})"
      end
    end
  end
end