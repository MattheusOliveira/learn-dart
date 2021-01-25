import 'Animal.dart';

abstract class Mamiferos extends Animal {
  String sexo;
  String desenvolvimento;

  Mamiferos.placentarios(this.sexo, idade, {docil}) : super.vertebrados(idade, docil: docil) {
    this.desenvolvimento = 'Placentarios';
  }

  Mamiferos.marsupiais(this.sexo, idade, {docil}) : super.vertebrados(idade, docil: docil) {
    this.desenvolvimento = 'Placentarios + Bolsa externa';
  }

  Mamiferos.monotremados(this.sexo, idade, {docil}) : super.vertebrados(idade, docil: docil) {
    this.desenvolvimento = 'Ovo';
  }

  void alimentar() {
    print('se alimentando...');
  } 


  //métodos sem escopo em classes abstratas devem ser sobrescritos em classes herdeiras
  void reproduzir();
}