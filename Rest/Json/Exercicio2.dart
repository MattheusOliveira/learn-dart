import 'dart:convert';
import 'dart:ffi';

void conversao() {
  var json = '''
    {
      "informacoes" : {
        "dataAula": "11/05/2019",
        "qtdeAlunos": 100
      },
      "dogs" : [
        {
          "nome": "Buldogue",
          "foto": "buldogue.jpg",
          "filhotes" : [
            {
              "nome": "Buldoguezinho 1",
              "foto": "buldogue_filhote1.jpg"
            },
            {
              "nome": "Buldoguezinho 2",
              "foto": "buldogue_filhote2.jpg"
            },
            {
              "nome": "Buldoguezinho 3",
              "foto": "buldogue_filhote3.jpg"
            }
          ]
        },
        {
          "nome": "Labrador",
          "foto": "labrador.jpg",
          "filhotes" : [
            {
              "nome": "Labradorzinho 1",
              "foto": "labrador_filhote1.jpg"
            },
            {
              "nome": "Labradorzinho 2",
              "foto": "labrador_filhote2.jpg"
            },
            {
              "nome": "Labradorzinho 3",
              "foto": "labrador_filhote3.jpg"
            }
          ]
        },
        {
          "nome": "Pastor",
          "foto": "pastor.jpg",
          "filhotes" : [
            {
              "nome": "Pastorzinho 1",
              "foto": "pastor_filhote1.jpg"
            },
            {
              "nome": "Pastorzinho 2",
              "foto": "pastor_filhote2.jpg"
            },
            {
              "nome": "Pastorzinho 3",
              "foto": "pastor_filhote3.jpg"
            }
          ]
        }
      ]
}
  ''';

  Map<String, dynamic> parsedJson = jsonDecode(json);
  print(parsedJson);
  var obj = Aula.fromJson(parsedJson);
  print(obj.dogs.map((e) => e.filhotes.map((e) => e.nome).toList()).toList());
  print('objeto: $obj');
}

void main() {
  conversao();
}

class Aula {
   Informacoes informacoes;
   List<Dog> dogs;

  Aula({this.informacoes, this.dogs});

  Aula.fromJson(Map<String,dynamic> json) {
    informacoes = Informacoes.fromJson(json['informacoes']);
    dogs = (json['dogs'] as List).map((e) => Dog.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'informacoes': informacoes,
      'dogs': dogs
    };
  }
}

class Informacoes {
   String dataAula;
   int qtdeAlunos;

  Informacoes({this.dataAula, this.qtdeAlunos});

  Informacoes.fromJson(Map<String, dynamic> json) {
    dataAula = json['dataAula'];
    qtdeAlunos = json['qtdeAlunos'];
  }

  Map<String, dynamic> toJson() {
    return {
      'dataAula': dataAula,
      'qtdeAlunos': qtdeAlunos
    };
  }
}

class Dog {
   String nome;
   String foto;
   List<Filhote> filhotes;

  Dog({this.nome, this.foto, this.filhotes});

  Dog.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    foto = json['foto'];
    filhotes = (json['filhotes'] as List).map((e) => Filhote.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'foto': foto,
      'filhotes': filhotes
    };
  }
}

class Filhote {
   String nome;
   String foto;

  Filhote({this.nome, this.foto});

  Filhote.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    foto = json['foto'];
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'foto': foto
    };
  }
}

