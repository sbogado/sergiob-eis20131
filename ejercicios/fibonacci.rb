require 'test/unit'

def es_cuadrado_perfecto(numero)
  raiz_cuadrada_de_numero = Math.sqrt(numero)
  raiz_cuadrada_de_numero.floor == raiz_cuadrada_de_numero
end

def es_de_fibonacci(numero)
  if numero < 0
    return false
  end
  if numero == 0
    return true
  end
  return es_cuadrado_perfecto(5*numero**2+4) || es_cuadrado_perfecto(5*numero**2-4)
end

class TestEsDeFibonacci < Test::Unit::TestCase
  def test_es_de_fibonacci_con_cero_debe_ser_verdadero
    assert(es_de_fibonacci(0))
  end

  def test_es_de_fibonacci_con_uno_debe_ser_verdadero
    assert(es_de_fibonacci(1))
  end

  def test_es_de_fibonacci_con_algun_negativo_debe_ser_falso
    assert(!es_de_fibonacci(-1))
    assert(!es_de_fibonacci(-8))
    assert(!es_de_fibonacci(-377))
    assert(!es_de_fibonacci(-400))
  end

  def test_es_de_fibonacci_con_numeros_pertenecientes_a_la_sucesion_de_fibonacci_debe_ser_verdadero
    assert(es_de_fibonacci(5))
    assert(es_de_fibonacci(8))
    assert(es_de_fibonacci(55))
    assert(es_de_fibonacci(233))
  end

  def test_es_de_fibonacci_con_numeros_no_pertenecientes_a_la_sucesion_de_fibonacci_debe_ser_falso
    assert(!es_de_fibonacci(10))
    assert(!es_de_fibonacci(35))
    assert(!es_de_fibonacci(130))
    assert(!es_de_fibonacci(378))
  end
end


