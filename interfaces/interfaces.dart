/**
 * Conceito: Iterfaces são modelos para implementar métodos e atributos em nossas classses
 * 
 * Regras: 
 * - Ao implmementar uma interface devemos utilizar todos os métodos e atributos
 * - No dart não tem sintexe para interfaces, pode ser uma classse concreta ou abstrata!
 * - Pode implementar mais de uma interface e deve sobrescrever todos os métodos e atributos!
 */

abstract class Cidadao {
  String nome;

  Cidadao(this.nome);

  void objetivosPessoais();

  void direitosDeveres() {
    print('Todo cidadão tem direitos e deveres');
  }
}

abstract class Presidencial {
  String partido;
  String ideologia;

  void ideologiaPolitica();
}

class Postagem {
  String postagem;

  void escreverPostagem() {
    print('');
  }
}

class Candidato extends Cidadao implements Postagem, Presidencial {
  String objetivo;

  Candidato(String nome, {this.ideologia, this.partido}) : super(nome) {
    direitosDeveres();
  }

  @override
  void objetivosPessoais() {
    print('${nome} tem o objetivo de $objetivo');
  }

  //interfaces
  @override 
  String postagem;

  @override 
  void escreverPostagem() {
    print('Postagem de $nome no facebook: $postagem');
  }

  @override 
  String ideologia;
  String partido;

  @override 
  void ideologiaPolitica() {
    print('$nome é candidato com ideologia de $ideologia pelo partido $partido');
  }
}

void main() {
  var bolsonaro = Candidato('Bolsonaro', ideologia: 'Direita', partido: 'psl');
  bolsonaro
    ..objetivo = 'Ganhar eleição'
    ..objetivosPessoais()
    ..postagem = 'Vou vacinar geral no Brasil!'
    ..escreverPostagem()
    ..ideologiaPolitica();
}
