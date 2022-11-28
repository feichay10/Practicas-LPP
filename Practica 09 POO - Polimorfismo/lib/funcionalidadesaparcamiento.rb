# frozen_string_literal: true

# * funcionalidadesaparcamiento.rb
# Autor: Cheuk Kelly Ng Pante
#
# Modulo FuncionalidadesAparcamiento
#
# Definicion del modulo FuncionalidadesAparcamiento compuesta por
# * Funcionalidad aparcar_vehiculo
# * Funcionalidad duracion_estancia
# * Funcionalidad precio_estancia
# * Funcionalidad reserva_plazas_minusvalidos
# * Funcionalidad numero_plazas_minusvalidos_libres
# * Funcionalidad numero_vehiculos_estacionados

module FuncionalidadesAparcamiento
  # Funcionalidad aparcar_vehiculo
  # Devuelve true si se ha podido aparcar el vehiculo
  # Devuelve false si no se ha podido aparcar el vehiculo
  # * Argumentos:
  #   - vehiculo: objeto de la clase Vehiculo
  # * Return:
  #   - Boolean
  def aparcar_vehiculo(vehiculo)
    for i in @conjunto_vehiculos
      if @conjunto_plazas_libre.length != 0
        @conjunto_plazas_ocupadas.push(@conjunto_plazas_libre[0])
        @conjunto_plazas_libre.delete_at(0)
        return true
      else
        return false
      end
    end
    return false
  end

  # Funcionalidad desaparcar_vehiculo
  # Devuelve la duracion de la estancia del vehiculo
  # * Argumentos:
  #  - tiempo_entrada: String con el tiempo de entrada del vehiculo
  #  - tiempo_salida: String con el tiempo de salida del vehiculo
  # * Return:
  #   - Integer con la duracion de la estancia del vehiculo
  def duracion_estancia(tiempo_entrada, tiempo_salida)
    if tiempo_entrada.is_a? String and tiempo_salida.is_a? String
      tiempo_entrada = tiempo_entrada.split(':')
      tiempo_salida = tiempo_salida.split(':')
      tiempo_entrada = tiempo_entrada[0].to_i * 60 + tiempo_entrada[1].to_i
      tiempo_salida = tiempo_salida[0].to_i * 60 + tiempo_salida[1].to_i
      if tiempo_entrada > tiempo_salida
        tiempo_salida += 24 * 60
      end
      return tiempo_salida - tiempo_entrada
    else
      raise ArgumentError, 'El tiempo de entrada y salida debe ser un string'
    end
  end

  # Funcionalidad precio_estancia
  # Devuelve el precio de la estancia del vehiculo
  # * Argumentos:
  #   - tiempo_estancia: Integer con la duracion de la estancia del vehiculo
  # * Return:
  #   - Float con el precio de la estancia del vehiculo
  def precio_estancia(tiempo_estancia)
    if tiempo_estancia.is_a? Integer and tiempo_estancia > 0
      return tiempo_estancia * @precio
    else
      raise ArgumentError, 'La duracion de la estancia debe ser un numero entero mayor que 0'
    end
  end

  # Funcionalidad reserva_plazas_minusvalidos
  # Devuelve true si hay plazas reservadas para minusvalidos
  # Devuelve false si no hay plazas reservadas para minusvalidos
  # * Argumentos:
  #   - Ninguno
  # * Return:
  #   - Boolean
  def reserva_plazas_minusvalidos
    resultado = @conjunto_plazas.length / 40
    if @minusvalidos >= resultado
      return true
    else
      return false
    end
  end

  # Funcionalidad numero_plazas_minusvalidos_libres
  # Devuelve el numero de plazas reservadas para minusvalidos libres
  # * Argumentos:
  #   - Ninguno
  # * Return:
  #   - Integer con el numero de plazas reservadas para minusvalidos libres
  def numero_plazas_minusvalidos_libres
    return @minusvalidos
  end

  # Funcionalidad numero_vehiculos_estacionados
  # Devuelve el numero de vehiculos estacionados
  # * Argumentos:
  #   - Ninguno
  # * Return:
  #   - Integer con el numero de vehiculos estacionados
  def numero_vehiculos_estacionados
    return @conjunto_vehiculos.length
  end
end