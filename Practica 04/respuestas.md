36. La diferencia que hay entre "\t\n" y '\t\n' es que en la primera hace literalmente lo que dentro por ejemplo el ejecutar puts "\t\n" este tabula y pasa a la siguiente pagina y luego '\t\n' lo que hace es sacar por pantalla el contenido entre las comillas simples

37 y 38. %q Se utiliza para crear strings sin usar comillas simples y %Q es para comillas dobles. Lo que hace %q es todo lo que este dentro entre comillas simples es sacar literalmente lo que hay, en cambio, entre el encomillado doble lo que hace es sacar el resultado de lo que hay dentro, por ejemplo: f = "apple" entonce si ejecutamos %Q{#{f}} el resultado va a dar apple

39. Lo que hay en c es "--4--\n--2--\n"

40. Lo que hay en c es "--#{a}--\n--#{b}--\n"

41. En s[0,2] = "he", s[-1,1] = "o", s[0,10] = "hello"

42. En g queda "hello world"

43. En e queda "..."

44. El resultado es "2 2 2 "

45. Crea un array de strings 

46. %w[\t \n] es un array de \t y \n

47. %W[\t \n] es un array de tabulacion y salto de linea

48. nils contiene --> [nil, nil, nil]

49. zeros contiene --> [0, 0, 0]

50. En b queda "[[1, 2], [3, 4]]"

51. En c queda "[0, 2, 4]" que serian los 3 primeros numeros pares empezando desde 0

52. - a[1,1] =  ["b"]
    - a[-2,2] = ["d","e"]
    - a[0..2] = ["a","b","c"]
    - a[0...1] = ["a"]
    - a[-2..-1] = ["d", "e]

53. - a[0,2] = %w{A B}; a = ["A,B", "c", "d", "e"] 
    - a[2..5] = %w{C D E}; a = ["A,B", "c", "C", "D", "E"]
    - a[0,0] = [1,2,3]; a = [1, 2, 3, "A,B", "c", "C", "D", "E"] 
    - a[0,2] = []; a = [3, "A,B", "c", "C", "D", "E"] 
    - a[-1,1] = [ 'Z' ]; a = [3, "A,B", "c", "C", "D", "Z"] 
    - a[-2,2] = nil; a = [3, "A,B", "c", "C", nil]

54. - a = (1...4).to_a --> [1,2,3]
    - a = a + [4, 5] --> [1, 2, 3, 4, 5]
    - a += [[6, 7, 8]] --> [1, 2, 3, 4, 5, [6, 7, 8]]
    - a = a + 9 --> TypeError (no implicit conversion of Integer into Array)

55. - x = %w{a b c b a} --> ["a", "b", "c", "b", "a"] 
    - x = x - %w{b c d} --> ["a", "a"] 

56. z = [0]*8 --> [0, 0, 0, 0, 0, 0, 0, 0]

57. - a = [] --> []
    - a << 1 --> [1]
    - a << [4, 5, 6] --> [1, [4, 5, 6]]
    -  a.concat [7, 8] --> [1, [4, 5, 6], 7, 8] 

58. - c = a | b --> [1, 2, 3, 4, 5]
    -  d = b | a --> [5, 4, 3, 2, 1] 
    -  e = a & b --> [2, 3, 4]
    -  f = b & a --> [4, 3, 2]

59. - a.to_a --> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] 
    - b.to_a --> [1, 2, 3, 4, 5, 6, 7, 8, 9] 
    - b.include? 10 --> false
    - b.include? 8 --> true
    - b.step(2) {|x| print "#{x} " } --> 1 3 5 7 9  => 1...10
    - 1..3.to_a --> NoMethodError 

60. - r.member? 50 --> true
    - r.include? 99.9 --> true
    - r.member? 99.9 --> true


61. - true.class --> TrueClass 
    - false.class --> FalseClass
    - puts "hello" if 0 --> nil
    - puts "hello" if nil --> nil
    - puts "hello" if "" --> nil

62. - x.class --> Symbol
    - x == 'sym' --> false
    - x == :sym --> true
    - z.class --> Symbol
    - x == ’sym’.to_sym --> :sym
    - x.to_s == ’sym’ --> true

63. - t = s --> "Ruby"
    - t[-1] = "" --> ""
    - print s = Rub => nil
    - t = "Java" --> "Java"
    - print s, t --> RubJava => nil

64. "%d %s" % [3, "rubies"] --> "3 rubies"

65. - x, y = 4, 5 --> [4, 5]
    - z = x > y ? x : y --> 5
    - x,y,z = [1,2,3] --> [1,2,3]

66. - x.keys --> [:a, :b] 
    - x.values --> [1, 2] 
    - x --> {:a=>1, :b=>2, :c=>3}
    - x --> {:a=>1, :b=>2, :c=>3} 
    - x --> {:b=>2, :c=>3}
    - x = { :a => 1, :b => 2, :c => 4 }
    - {:b=>2, :c=>4, :a=>1} --> {:a=>1, :b=>2, :c=>4}
    - x.delete_if { |k,v| v % 2 == 0 } --> {:a=>1} 
    - x --> {:a=>1} 

67. - counts = Hash.new(0) --> establece el valor predeterminado para cualquiera tecla en 0
    - counts = {} --> lo establece como nils

68. Devuelve ["hello", "world", "hello", "LPP"]
