/**
 * TRATAMENTO DE EXCECAO!
 * - try: Usado para testar uma lógica.
 * - catch: Captura erros na lógica.
 * - on: Captura erros específicos/conhecidos na lógica try.
 * - throw: Exception: Excecão criada pelo usuário e tratada no catch.
 * - finally: Executado ao final try/catch, com ou sem exceção! Utilizado para liberar recuros na lógica try.
 * 
 */

caso1() {
  //Try Catch

  try {
    int resultado = 1 ~/ 0;
    print('Resultado: $resultado');
  } catch (e) {
    print('Excecao: $e');
  }
}

caso2() {
  // on: Erro já conhecido
  try {
    int resultado = 1 ~/ 0;
    print('Resultado: $resultado');
  } on IntegerDivisionByZeroException {
    print('Excecão: Não é possível dividir por zero');
  } catch (e) {
    print('Excecao: $e');
  }
}

caso3() {
  try {
    int resultado = 1 ~/ 0;
    print('Resultado: $resultado');
  } catch (e, s) {
    print('Excecao: $e');
    print('Stack Trace: $s');
    // O Stack trace mostra a linha onde a excessão ocorreu
  }
}

caso4() {
  try {
    int resultado = 1 ~/ 0;
    print('Resultado: $resultado');
  } catch (e) {
    print('Excecao: $e');
  } finally {
    print('finally: Com ou sem excecao "finally" será executado!');
  }
}

caso5() {
  try {
    int valorA = 1, valorB = 0;
    double resultado = valorA / valorB;

    if (resultado.isInfinite)
      throw Exception('A variável valor B deve ser != 0');

    print('Resultado: $resultado');
  } catch (e) {
    print('Excecao $e');
  }
}

void main() {
  caso1();
  caso2();
  caso3();
  caso4();
  caso5();
}
