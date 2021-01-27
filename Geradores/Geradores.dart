/**
 * - Geradores são funções que produzem sequencias de valores usando:
 *   * Funções sincronas que retornam Iterable
 *   * Funções assíncronas que retornam Stream
 */

funcoesGeradores() {
  Iterable<int> funcoesSincronas(int repeticaoMaxima) sync* {
    int i = 0;
    while(i < repeticaoMaxima) yield ++i;
  }
  print(funcoesSincronas(5));

  funcoesAssincronas(int repeticaoMaxima) async* {
    int i = 0;
    while(i < repeticaoMaxima) yield ++i;
  }
  funcoesAssincronas(3).forEach((element) => print(element));
}

funcoesGeradorasRecursivas() {
  Iterable<int> funcoesSincrona(int repeticaoMaxima) sync* {
    for(int i = 1; i <= repeticaoMaxima; i++) {
      yield i;
      yield* funcoesSincrona(1 - repeticaoMaxima);
    }
  }
  print(funcoesSincrona(3));

  Stream<int> funcoesAssicronas(int repeticaoMaxima) async* {
    for(int i = 1; i <= repeticaoMaxima; i++) {
      yield i;
      yield* funcoesAssicronas(1 - repeticaoMaxima);
    }
  }
  funcoesAssicronas(3).forEach((element) => print(element));
}

void main() {
  //funcoesGeradores();
  funcoesGeradorasRecursivas(); 
}