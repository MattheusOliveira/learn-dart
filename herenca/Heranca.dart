void main() {
  var cao = Cao('labrador', 'femea', 'bolinha', terrestre: true);

  print(cao.toString());
  print(cao.terrestre);
  print(cao.dormir());
  print(cao.latir());
  print(cao.alimentar());

}

class Animal {
  String nome;

  Animal(this.nome);

  String dormir() {
    return 'animal dormindo';
  }
}

class Mamifero extends Animal {
  String sexo;
  bool terrestre;

  Mamifero(this.sexo, nome, this.terrestre) : super(nome);

  String alimentar() {
    return 'mamifero se alimentando';
  }
}

class Cao extends Mamifero {
  String raca;  
  
  Cao(this.raca, String sexo, String nome, {bool terrestre}) : super(sexo, nome, terrestre) {
    this.terrestre = (terrestre == null) ? false : terrestre;
  }

  String latir() {
    return 'cão latindo';
  }

  @override
  String toString() => 'Cao(raca: $raca)';
}
