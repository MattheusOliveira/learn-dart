class Usuario {
  String _nome;
  String _sobrenome;
  int _idade;
  String estado_civil;

  Usuario(this._nome, this._sobrenome, this._idade, {this.estado_civil: 'solteiro'}) {
    this.estado_civil = 'de férias';
  }

  get nome => this._nome;

  set nome(String nome) {
    this._nome = nome;
  }

  get idade {
    return this._idade;
  }

}