import 'dart:convert';

conversaoDireta() {
  String jsonData = '''
  {
    "nome" : "Matheus",
    "idade" : 36,
    "email" : "fm@gmail.com"
  }
  ''';

  //DECODE
  Map<String, dynamic> parsedJson = jsonDecode(jsonData);
  print('parsedJson: $parsedJson\n');
  String nome = parsedJson['nome'];
  int idade = parsedJson['idade'];
  String email = parsedJson['email'];
  print('USO DIRETO: nome: $nome idade: $idade email: $email');

  // ENCODE
  Map<String, dynamic> map = {'nome': nome, 'idade': idade, 'email': email};
  String toJson = jsonEncode(map);
  print('ToJson: $toJson');
}

/**
 * Serialização Json em Objeto 
 * - Utiliza recursos estáticos de linguagens:
 * - Seguranças de tipos, autocompletar e execução de tempo de compilação
 */
conversaoObjeto() {
  String jsonData = '''
  [
    {
    "nome" : "Matheus",
    "idade" : 36,
    "email" : "matheus@gmail.com"
    },
    {
    "nome" : "Rafael",
    "idade" : 17,
    "email" : "rafael@gmail.com"
    }
  ]
  ''';

  //DECODE
  List<dynamic> parsedJson = jsonDecode(jsonData);
  print('parsedJson: $parsedJson');
  ListaUsuarios listaUsuarios = ListaUsuarios.fromJson(parsedJson);
  Usuario usuario =
      listaUsuarios.usuarios.singleWhere((e) => e.nome == 'Matheus');

  print(
      'USO OBJETO: nome: ${usuario.nome} idade: ${usuario.idade} eamil: ${listaUsuarios.usuarios[0].email}\n');

  var usuarioNovo = Usuario.fromJson(
      {'nome': 'Stela', 'idade': 38, 'email': 'stela@gmail.com'});
  listaUsuarios.usuarios.addAll([usuarioNovo]);

  //ENCODE
  List<dynamic> lista = listaUsuarios.toJson();
  String toJson = json.encode(lista);
  print('ToJson: $toJson');
}

class ListaUsuarios {
  List<Usuario> usuarios;

  //? Constrututor default da classe
  ListaUsuarios({this.usuarios});

  factory ListaUsuarios.fromJson(List<dynamic> json) {
    return ListaUsuarios(
        usuarios: json.map((e) => Usuario.fromJson(e)).toList());
  }
  List<dynamic> toJson() {
    return usuarios;
  }
}

class Usuario {
  String nome;
  int idade;
  String email;
  //? Construtor default da classe
  Usuario({this.nome, this.idade, this.email});

  //? Construtor nomeado para criar uma nova instância a partir de um map
  Usuario.fromJson(Map<String, dynamic> json) {
    this.nome = json['nome'];
    this.idade = json['idade'];
    this.email = json['email'];
  }

  //? Construtor Factory retorna uma nova instância do construtor default da classe a partir de um map
  // factory Usuario.fromJson(Map<String, dynamic> json) {
  //   return Usuario(
  //     nome: json['nome'],
  //     idade: json['idade'],
  //     email: json['email'],
  //   );
  // }

  //? Construtor com lista de inicialização, define parâmetros antes de executar o escopo do construtor
  // Usuario.fromJson(Map<String, dynamic> json):
  //   nome = json['nome'],
  //   idade = json['idade'],
  //   email = json['email'] {
  //     //configurações iniciais
  // }

  //? Construtor com lista de inicialização usa this para passar os parâmetros para o construtor default
  // Usuario.fromJson(Map<String, dynamic> json)
  //     : this(
  //         nome: json['nome'],
  //         idade: json['idade'],
  //         email: json['email'],
  //       );

  Map<String, dynamic> toJson() {
    return {'nome': nome, 'idade': idade, 'email': email};
  }
}

void main() {
  //conversaoDireta();
  conversaoObjeto();
}
