# * funciones.rb
# Autor: Cheuk Kelly Ng Pante
# Modulo Funciones
#
# Definicion del modulo Funciones compuesto por
# CONSTANTES:
# * CONST_COMPLETO = :completo
# * CONST_LIBRE = :libre
# Metodos:
# * self.estado_parking

module Funciones
  CONST_COMPLETO = :completo
  CONST_LIBRE = :libre

  def self.estado_parking(datos_parking)
    # return nil unless datos_parking.is_a?(Aparcamiento::Datos)
    if datos_parking > 0
      CONST_LIBRE
    else
      CONST_COMPLETO
    end
  end
end