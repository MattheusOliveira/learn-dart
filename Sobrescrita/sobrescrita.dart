import 'dart:io';

import 'Animal.dart';
import 'Cao.dart';

// void main() {

//   var cao = Cao.domestico('Lili', 'vira-lata', 'Femea');
//   print('nome: ${cao.nome}, raca: ${cao.raca}, sexo: ${cao.sexo}, idade: ${cao.idade}, docil: ${cao.docil}');
//   print('desenvolvimento: ${cao.desenvolvimento}, tipo: ${cao.coluna ? 'Vertebrado' : 'invertebrado'}');

//   cao..dormir()..alimentar()..reproduzir()..acao();
// }

abstract class Artropodes extends Animal {
  String sexo;
  String ataque;

  Artropodes.insetos(this.sexo, idade, docil) : super.invertebrados(idade, docil: docil) {
    this.ataque = 'mandibula';
  }

  Artropodes.aracnideos(this.sexo, idade, docil) : super.invertebrados(idade, docil: docil) {
    this.ataque = 'ferrão';
  }

  Artropodes.crustaceos(this.sexo, idade, docil) : super.invertebrados(idade, docil: docil) {
    this.ataque = 'garras';
  }

  void atacar() {
    print('atacar como um artropode');
  }

  void voar();
}

class Abelha extends Artropodes {
  String cargo;
  
  Abelha.colmeia(this.cargo, String sexo, {String idade = 'indefinido', docil = false}) : super.insetos(sexo, idade, docil);

  @override 
  void atacar() {
    print('ataca como uma abelha');
  }

  @override
  void voar() {
    print('voa como uma abelha');
  }

}

void main() {
  var abelha = Abelha.colmeia('operária', 'femea', idade: '0', docil: false);

  print('cargo: ${abelha.cargo}, sexo: ${abelha.sexo}, idade: ${abelha.idade}, docil: ${abelha.docil}');

  abelha..atacar()..voar();
}

//Criar uma classe Abelha que herda de Artropodes com os construtores (insetos, aracnídeos, crustáceos)
// que herde de Animal no construtor Invertebrados!