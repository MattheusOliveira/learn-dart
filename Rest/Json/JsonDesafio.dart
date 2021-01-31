import 'dart:convert';

conversao() {
  String jsonData = '''
  {
    "nome" : "Fernando", 
    "idade": 36, 
    "parentes": {
      "mae": "Marlene",
      "pai": "Delcio"
    },
    "tarefas": [
      "Pagar contas",
      "Estudar"
    ],
    "conjuge": {
      "nome" : "Leila", 
      "idade": 31,
      "parentes": {
        "mae": "Lindraci",
        "pai": "Pedro"
      }
    },
    "filhos" : [      
      {
        "nome" : "Chloe", 
        "idade": 1, 
        "vacinas": [
          "ACWY",
          "Sarampo"
        ]
      },
      {
        "nome" : "Bartolomeu", 
        "idade": 5, 
        "vacinas": [
          "ACWY",
          "Sarampo",
          "Meningite"
        ]
      }
    ],
    "bens": {
      "veiculos": [
        {
          "marca": "Maverick",
          "modelo": "Ford",
          "caracteristicas": {
            "tipo": "passeio",
            "passageiros": 5
          },
          "multas": [
            {
              "descricao": "Excesso Velocidade",
              "tipo": "Gravissima",
              "pontos": 7
            },
            {
              "descricao": "Estacionar Local Proibido",
              "tipo": "Grave",
              "pontos": 4
            }
          ]
        },
        {
          "marca": "Kawasaki",
          "modelo": "Ninja H2R",
          "caracteristicas": {
            "tipo": "corrida",
            "passageiros": 2
          },
          "multas": [
            {
              "descricao": "Excesso Velocidade",
              "tipo": "Gravissima",
              "pontos": 7
            },
            {
              "descricao": "Excesso Velocidade",
              "tipo": "Gravissima",
              "pontos": 7
            },
            {
              "descricao": "Excesso Velocidade",
              "tipo": "Gravissima",
              "pontos": 7
            }
          ]
        }
      ],
      "imoveis": [
        {
          "tipo": "casa",
          "endereco": "Rua dos tolos, 0, Vila do Chaves",
          "contas": [
            {
              "tipo": "IPTU",
              "valor": 1000
            },
            {
              "tipo": "Condominio",
              "valor": 500
            }
          ]
        }
      ]
    }
  }
  ''';
  Map<String, dynamic> parsedJson = jsonDecode(jsonData);
  Pessoa pessoa = Pessoa.fromJson(parsedJson);
  print('DECODE: $parsedJson');
  print(
      'USO DIRETO: ${parsedJson['bens']['veiculos'][0]['multas'][0]['descricao']}');

  print(
      'USO OBJETO: ${pessoa.bens.veiculos.map((e) => e.multas.map((e) => e.descricao)).toList().toList()}');

  Map<String, dynamic> map = pessoa.toJson();
  String toJson = jsonEncode(map);
  print('ENCODE: ${toJson}');
}

//! Regra #1 Indentificar e criar as classes de acordo com o json.
//! Regra #2 Criar os construtores do mais profundo até a raiz.
//! Regra #3 Fazer tratamentos.

void main() {
  conversao();
}

class Pessoa {
  final String nome;
  final int idade;
  final List<String> tarefas;
  final Parentes parentes;
  final Conjuge conjuge;
  final List<Filho> filhos;
  final Bens bens;

  Pessoa({
    this.nome,
    this.idade,
    this.tarefas,
    this.parentes,
    this.conjuge,
    this.filhos,
    this.bens,
  });

  Pessoa.fromJson(Map<String, dynamic> json)
      : this(
          nome: json['nome'],
          idade: json['idade'],
          tarefas: List<String>.from(json[
              'tarefas']), // json['tarefas'].cast<String>() * trata err: List<dynamic> is not a subtype of type List<String>
          parentes: Parentes.fromJson(json['parentes']),
          conjuge: Conjuge.fromJson(json['conjuge']),
          filhos: (json['filhos'] as List<dynamic>)
              .map((e) => Filho.fromJson(e))
              .toList(), //trata err: List<dynamic> is not a subtype of type List<Filho>
          bens: Bens.fromJson(json['bens']),
        );

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'idade': idade,
      'tarefas': tarefas,
      'parentes': parentes,
      'conjuge': nome,
      'filhos': nome,
      'bens': nome
    };
  }
}

class Parentes {
  final String mae;
  final String pai;

  Parentes({this.mae, this.pai});

  Parentes.fromJson(Map<String, dynamic> json)
      : this(
          mae: json['mae'],
          pai: json['pai'],
        );

  Map<String, dynamic> toJson() {
    return {
      'mae': mae,
      'pai': pai,
    };
  }
}

class Conjuge {
  final String nome;
  final int idade;
  final Parentes parentes;

  Conjuge({this.nome, this.idade, this.parentes});

  Conjuge.fromJson(Map<String, dynamic> json)
      : this(
          nome: json['nome'],
          idade: json['idade'],
          parentes: Parentes.fromJson(json['parentes']),
        );

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'idade': idade,
      'parentes': parentes,
    };
  }
}

class Filho {
  final String nome;
  final int idade;
  final List<String> vacinas;

  Filho({this.nome, this.idade, this.vacinas});

  Filho.fromJson(Map<String, dynamic> json)
      : this(
          nome: json['nome'],
          idade: json['idade'],
          vacinas: json['vacinas'].cast<String>(),
        );

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'idade': idade,
      'vacinas': vacinas,
    };
  }
}

class Bens {
  final List<Veiculo> veiculos;
  final List<Imovel> imoveis;

  Bens({this.veiculos, this.imoveis});

  Bens.fromJson(Map<String, dynamic> json)
      : this(
          veiculos: (json['veiculos'] as List)
              .map((e) => Veiculo.fromJson(e))
              .toList(),
          imoveis:
              (json['imoveis'] as List).map((e) => Imovel.fromJson(e)).toList(),
        );

  Map<String, dynamic> toJson() {
    return {
      'veiculos': veiculos,
      'imoveis': imoveis,
    };
  }
}

class Veiculo {
  final String marca;
  final String modelo;
  final Caracteristicas caracteristicas;
  final List<Multa> multas;

  Veiculo({this.marca, this.modelo, this.caracteristicas, this.multas});

  Veiculo.fromJson(Map<String, dynamic> json)
      : this(
          marca: json['marca'],
          modelo: json['modelo'],
          caracteristicas: Caracteristicas.fromJson(json['caracteristicas']),
          multas:
              (json['multas'] as List).map((e) => Multa.fromJson(e)).toList(),
        );

  Map<String, dynamic> toJson() {
    return {
      'marca': marca,
      'modelo': modelo,
      'caracteristicas': caracteristicas,
      'multas': multas,
    };
  }
}

class Caracteristicas {
  final String tipo;
  final int passageiros;

  Caracteristicas({this.tipo, this.passageiros});

  Caracteristicas.fromJson(Map<String, dynamic> json)
      : this(
          tipo: json['tipo'],
          passageiros: json['passageiros'],
        );

  Map<String, dynamic> toJson() {
    return {
      'tipo': tipo,
      'passageiros': passageiros,
    };
  }
}

class Multa {
  final String descricao;
  final String tipo;
  final int pontos;

  Multa({this.descricao, this.tipo, this.pontos});

  Multa.fromJson(Map<String, dynamic> json)
      : this(
          descricao: json['descricao'],
          tipo: json['tipo'],
          pontos: json['pontos'],
        );

  Map<String, dynamic> toJson() {
    return {
      'descricao': descricao,
      'tipo': tipo,
      'pontos': pontos,
    };
  }
}

class Imovel {
  final String tipo;
  final String endereco;
  final List<Conta> contas;

  Imovel({this.tipo, this.endereco, this.contas});

  Imovel.fromJson(Map<String, dynamic> json)
      : this(
          tipo: json['tipo'],
          endereco: json['endereco'],
          contas:
              (json['contas'] as List).map((e) => Conta.fromJson(e)).toList(),
        );

  Map<String, dynamic> toJson() {
    return {
      'tipo': tipo,
      'endereco': endereco,
      'contas': contas,
    };
  }
}

class Conta {
  final String tipo;
  final int valor;

  Conta({this.tipo, this.valor});

  Conta.fromJson(Map<String, dynamic> json)
      : this(
          tipo: json['tipo'],
          valor: json['valor'],
        );

  Map<String, dynamic> toJson() {
    return {
      'tipo': tipo,
      'valor': valor,
    };
  }
}
