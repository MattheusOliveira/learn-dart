import 'Mamiferos.dart';

class Cao extends Mamiferos {
  String nome;
  String raca;

  Cao.domestico(this.nome, this.raca, String sexo, {String idade = 'indefinida', bool docil = true}) : super.placentarios(sexo, idade, docil: docil);

  Cao.selvagem(this.nome, this.raca, String sexo, {String idade = 'indefinida', bool docil = false}) : super.placentarios(sexo, idade, docil: docil);

  @override //sobrescreve o método da classe herdada
  void dormir() {
    print('Dormi como um cão!');
  }

  @override  
  void alimentar() {
    super.alimentar(); //implementa o escopo herdado (super)
    print('cão!');
  }

  @override
  void reproduzir() {
    print('Reproduz como um cao!');
  }

  void acao() {
    print('Late como um cao');
  }

}