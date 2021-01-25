import 'dart:math';

class Pessoa {
  String nome, sobrenome;
  int _identidade;

  Pessoa(this.nome, this.sobrenome, {int identidade}) {
    this._identidade = (identidade == null) ? Random().nextInt(99999999) : identidade;
  }
  int get identidade => _identidade;
}

void main() {
  Pessoa p1 = Pessoa('Matheus', 'Oliveira', identidade: 12345678);
  Pessoa p2 = Pessoa('Marcos', 'Felipe', identidade: 87654321);

  List<Pessoa> pessoas = [p1,p2];
  pessoas.add(Pessoa('Lili', 'casa'));

  for(var i = 0; i < pessoas.length; i++) {
    print('for in: ${pessoas[i].nome} ${pessoas[i].sobrenome} ${pessoas[i].identidade}');
  }

  for(var pessoa in pessoas) {
    print('for: ${pessoa.nome} ${pessoa.sobrenome} ${pessoa.identidade}');
  }

  pessoas.forEach((pessoa) {
    print('forEach: ${pessoa.nome} ${pessoa.sobrenome} ${pessoa.identidade}');
  });
}