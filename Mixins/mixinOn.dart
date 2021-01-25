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

abstract class Artista {
  void acao() {
    print('Performista..');
  }
}

//MIXINS

mixin Cantor on Artista {
  void acao() {
    print('canta..');
  }
}

class Dancarino {
  void acao() {
    print('Dança..');
  }
}

//INTERFACE

abstract class Acao {
  void executar();
}

//Classes Concretas

class Musico extends Artista with Dancarino, Cantor implements Acao {
  void acao() => print('Compoe');

  @override
  void executar() {
    super.acao();
    acao();
  }

}

class MC with Dancarino implements Acao {
  void acao() => print('Mixa..somzeira');

  @override
  void executar() {
    super.acao();
    acao();
  }
}

main() {
  Musico musico = Musico();
  musico.executar();

  

  MC mc = MC();
  mc.executar();
}