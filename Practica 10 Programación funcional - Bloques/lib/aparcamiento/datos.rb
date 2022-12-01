#frozen_string_literal: true

# * datos.rb
# Autor: Cheuk Kelly Ng Pante
# 
# Clase Datos
# 
# Definicion de la clase Datos compuesta por
# * metodo initialize
# * metodo numero_plazas
# * metodo numero_plazas_libres
# * indice_sostenibilidad
# * <=>

module Aparcamiento
  # Clase Datos
  class Datos
    include Funciones, Comparable
    attr_reader :accesibilidad, :seguridad, :identificacion, :nombre_comercial, :descripcion, :conjunto_plazas, :conjunto_plazas_libre, :conjunto_plazas_ocupadas, :distancia, :precio, :num_minusvalidos
    def initialize(accesibilidad, seguridad, identificacion, nombre_comercial, descripcion, conjunto_plazas, conjunto_plazas_libre, conjunto_plazas_ocupadas, distancia, precio, num_minusvalidos)
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

      @distancia = distancia
      @precio = precio
      @num_minusvalidos = num_minusvalidos
    end

    # Metodo to_s
    # Devuelve un string con la informacion de los datos
    # * Argumentos:
    #   - Ninguno
    # * Return:
    #   - String con la informacion de los datos
    def to_s
      return "Los datos del aparcamiento son: Tiene una accesibilidad de: #{accesibilidad}, una seguridad de: #{seguridad}, un identificador de: #{identificacion}, un nombre comercial de: #{nombre_comercial}, una descripcion de: #{descripcion}, un conjunto de plazas de: #{conjunto_plazas}, un conjunto de plazas libres de: #{conjunto_plazas_libre}, un conjunto de plazas ocupadas de: #{conjunto_plazas_ocupadas}"
    end

    # Metodo numero_plazas
    # Devuelve el numero de plazas
    # * Argumentos:
    #   - Ninguno
    # * Return:
    #   - Numero de plazas
    def numero_plazas
      return @conjunto_plazas.length
    end

    # Metodo numero_plazas_libres
    # Devuelve el numero de plazas libres
    # * Argumentos:
    #   - conjunto_plazas -> Array con las plazas
    # * Return:
    #   - Numero de plazas libres
    def numero_plazas_libres(conjunto_plazas)
      contador = 0
      for plaza in conjunto_plazas
        if plaza.estado_plazas == :libre
          contador = contador + 1
        end
      end
      return contador
    end

    # Método indice_sostenibilidad
    # Devuelve el indice de sostenibilidad
    # * Argumentos:
    #   - Ninguno
    # * Return:
    #   - Indice de sostenibilidad (1 aceptable, 2 bueno o 3 excelente)
    def indice_sostenibilidad
      if distancia.is_a? Float and precio.is_a? Float
        if distancia > 0 && distancia <= 20.0 and precio > 0.50
          return 1
        elsif distancia >= 30.0 && distancia < 40.0 and precio >= 0.10 && precio <= 0.50
          return 2
        elsif distancia >= 40.0 and precio < 0.10
          return 3
        end
      else 
        raise ArgumentError, "La distancia y el precio debe ser un numero flotante"
      end
      return 0
    end

    # Método <=>
    # Compara dos objetos de la clase Datos
    # * Argumentos:
    #   - Otro objeto de la clase Datos
    def <=>(other)
      indice_sostenibilidad <=> other.indice_sostenibilidad
    end
  end
end