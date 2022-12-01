# Aparcamiento

# Practica 10 Programación funcional. Bloques
* Cheuk Kelly Ng Pante (alu0101364544@ull.edu.es)

## Indice de Sostenibilidad
| Indicador                  | Aceptable   | Bueno        |  Excelente  |
| :------------------------: | :---------: | :----------: | :---------: |
| Índice de sostebibilidad   | 1           | 2            | 3           |  
| Distancia                  | <= 20.0     | 30.0-40.0    | > 40.0      |
| precio (€/h)               | > 0.50      | 0.10-0.50    | < 0.10      |

Calcular el índice de sostenibilidad de un aparcamiento en función de la distancia y el precio de la hora. Para ello, se
ha creado un método en la clase Datos `indice_sostenibilidad` que calcula el índice de sostenibilidad de un aparcamiento 
segun los datos que hay en la tabla. 

```ruby
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
```

## Seleccionar los diferentes estacionamientos con plazas libres o con plazas de minusvalidos con mayor indice de sostenibilidad 
En la clase `Datos` se ha incluido el modulo 'Comparable' para poder comparar los datos de los aparcamientos. Y se ha creado
el metodo `<=>` para poder comparar los datos de los aparcamientos. 
```ruby
# Método <=>
# Compara dos objetos de la clase Datos
# * Argumentos:
#   - Otro objeto de la clase Datos
def <=>(other)
    indice_sostenibilidad <=> other.indice_sostenibilidad
end
```

Ya creado el método '<=>' se ha creado expectativas para comprobar que se puede comparar los datos de los aparcamientos.
```ruby
# Expectativas para seleccionar el estacionamiento con plazas libres que tiene mayor indice de sostenibilidad
expect(estacionamiento1.select{|x| (x.conjunto_plazas_libre.length > 0)}.max).to eq(@intersc)

# Expectativas para seleccionar el estacionamiento con plazas de minusvalidos libres que tiene mayor indice de sostenibilidad
expect(estacionamiento1.select{|x| (x.num_minusvalidos > 0)}.max).to eq(@campusanchieta)

# Expectativas para que calcula el porcentaje de ocupacion de cada uno de ellos
expect(estacionamiento1.map{|x| (x.conjunto_plazas_ocupadas.length.to_f / x.conjunto_plazas.length.to_f) * 100}).to eq([75.0, 75.0, 75.0, 75.0])

# Expectativas que calcula el porcentaje de plazas de minusvalidos libres de cada uno de ellos
expect(estacionamiento1.map{|x| (x.num_minusvalidos.to_f / x.conjunto_plazas.length.to_f) * 100}).to eq([50.0, 50.0, 50.0, 50.0])
```
