require 'test/unit'

def es_palindromo(palabra)
  palabra_en_minuscula = palabra.downcase
  palabra_en_minuscula == palabra_en_minuscula.reverse
end

class TestEsPalindromo < Test::Unit::TestCase

  def test_es_palindromo_de_un_string_vacio_debe_ser_verdadero
    assert(es_palindromo(""))
  end

  def test_es_palindromo_de_un_string_no_palindromo_debe_ser_falso
    assert(!es_palindromo("nose"))
    assert(!es_palindromo("piso"))
    assert(!es_palindromo("escalera"))
    assert(!es_palindromo("autopista"))
  end

  def test_es_palindromo_de_un_palindromo_con_cantidad_de_letras_impares_debe_ser_verdadero
    assert(es_palindromo("arepera"))
    assert(es_palindromo("anilina"))
    assert(es_palindromo("anana"))
    assert(es_palindromo("Malayalam"))
    assert(es_palindromo("Oso"))
  end
end

