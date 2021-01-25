/**
 * Coneito:
 *  - Mixin permite implementar métodos e atributos de outras classes
 * 
 * Regras: 
 *  - Devem ser implementados antes das interfaces
 *  - Pode ser implementados a partir de uma class concreta ou abstrata
 *  - Não pode implementar uma classe que estenda  e extender de uma outra classe mixin
 *  - Pode implementar mais de um mixin, e não é obrigatório usar todos métodos e atributos
 *  - As classes que possuem métodos iguais serão sobrescritas em ordem até a classe herdeira
 * 
 * ON
 *  - É obrigatório declarar sua classe como mixin
 *  - Restringi o uso de mixin as classes que estendem ou implementam a classe declarada
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

//MIXINS
mixin Elegivel on Cidadao {
  bool elegivel = false;
  void prestacaoContas();
}

abstract class Conta {
  double _saldo, salario = 33000;
  get saldo => this._saldo;
  set depositar(double valor) => this._saldo = valor;

  bool declaracaoRenda() => this._saldo/12 < salario;
}


class Candidato extends Cidadao with Elegivel, Conta implements Postagem, Presidencial {
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

  //mixins
  @override 
  void prestacaoContas() {
    elegivel = super.declaracaoRenda();
    if(elegivel) {
      print('Candidato $nome passou na prestação de contas! \nAutorizado a concorrer nas eleições 2018');
    } else {
      print('Candidato $nome foi barrado na prestação de contas!\nSaldo $saldo excede a renda declarada para o Presidente');
    }
  }
}

void main() {
  var bolsonaro = Candidato('Bolsonaro', ideologia: 'Direita', partido: 'psl');
  bolsonaro
    ..objetivo = 'Ganhar eleição'
    ..objetivosPessoais()
    ..postagem = 'Vou vacinar geral no Brasil!'
    ..escreverPostagem()
    ..ideologiaPolitica()
    ..depositar = 396000
    ..prestacaoContas();
}