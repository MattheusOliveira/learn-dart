import 'dart:convert';

void conversao() {
  String json = '''
    {
          "nome": "BRUNO GABRIEL FREITAS JUSTINO",
          "sexo": "M",
          "cartao": {
            "numero": "5701.7724.1266.7391",
            "cvv": "185",
            "validade": "10/2024",
            "dependentes" : {
              "nome": "Matheus Oliveira",
              "sexo": "masculino",
              "idade": 26
            }
          },
          "mae": "SAMANTA PINTO COELHO LINHARES",
          "documentos": {
            "rg": "995014280 SSP MG",
            "cpf": "691.525.197-91"
          },
          "treinos": [
            "natacao",
            "futebol",
            "tenis"
          ],
          "sangue": "B+",
          "emprego": "cozinheiro",
          "nascimento": "03/08/1939",
          "telefone": "(35)1594-9692",
          "faculdades":[
            {
              "nome": "Sistemas de informacao",
              "duracao": 4,
              "instituicao": "IFG"
            },
            {
              "nome": "Gestao",
              "duracao": 2,
              "instituicao": "UFG"
            }
          ],
          "endereco": {
            "cidade": "P. DE CALDAS",
            "uf": "MG",
            "logradouro": "TRAVESSA MAJOR CARLOS ANTUNES, 506",
            "cep": "99.557-668"
          },
          "email": "BRUNO.GFJ@gmail.com"
        }
  ''';
  //DECODE
  Map<String, dynamic> parsedJson = jsonDecode(json);
  print(parsedJson);

  Pessoa pessoa = Pessoa.fromJson(parsedJson);
  print(pessoa.faculdades.map((e) => e.instituicao).toList());

  //ENCODE
  Map<String, dynamic> map = pessoa.toJson();
  String j = jsonEncode(map);
  print(j);
}

void main() {
  conversao();
}


//! Regra #1 Indentificar e criar as classes de acordo com o json.
//! Regra #2 Criar os construtores do mais profundo até a raiz.
//! Regra #3 Fazer tratamentos.

class Pessoa {
  String nome;
  String sexo;
  Cartao cartoes;
  String mae;
  Documentos documentos;
  List<String> treinos;
  String sangue;
  String emprego;
  String nascimento;
  String telefone;
  List<Faculdade> faculdades;
  Endereco endereco;
  String email;
  Dependentes dependentes;

  Pessoa(
      {this.nome,
      this.sexo,
      this.cartoes,
      this.mae,
      this.documentos,
      this.treinos,
      this.sangue,
      this.emprego,
      this.nascimento,
      this.telefone,
      this.faculdades,
      this.endereco,
      this.email,
      this.dependentes});

  Pessoa.fromJson(Map<String, dynamic> json) 
    :this(
      sexo: json['sexo'],
      cartoes: json['cartoes'],
      mae: json['mae'],
      documentos: Documentos.fromJson(json['documentos']),
      treinos :json['treinos'].cast<String>(),
      sangue: json['sangue'],
      emprego: json['emprego'],
      nascimento: json['nascimento'],
      telefone: json['telefone'],
      faculdades: (json['faculdades'] as List).map((e) => Faculdade.fromJson(e)).toList(),
      endereco: Endereco.fromJson(json['endereco']),
      email: json['email'],
      dependentes: json['dependentes'],
    );

  Map<String, dynamic> toJson() {
    return {
      'sexo': sexo,
      'cartoes': cartoes,
      'mae': mae,
      'documentos': documentos,
      'treinos': treinos,
      'sangue': sangue,
      'emprego': emprego,
      'nascimento': nascimento,
      'telefone': telefone,
      'faculdades': faculdades,
      'endereco': endereco,
      'email': email,
      'dependentes': dependentes
    };
  }
}

class Cartao {
  String numero;
  String cvv;
  String validade;
  Dependentes dependentes;

  Cartao({this.numero, this.cvv, this.validade});

  Cartao.fromJson(Map<String, dynamic> json) {
    this.numero = json['numero'];
    this.cvv = json['cvv'];
    this.validade = json['validade'];
    this.dependentes = json['dependentes'];
  }

  Map<String, dynamic> toJson() {
    return {
      'numero': numero,
      'cvv': cvv,
      'validade': validade,
      'dependentes': dependentes
    };
  }
}

class Dependentes {
  String nome;
  String sexo;
  String idade;

  Dependentes({
    this.nome,
    this.sexo,
    this.idade,
  });

  Dependentes.fromJson(Map<String, dynamic> json) {
    this.nome = json['nome'];
    this.sexo = json['sexo'];
    this.idade = json['idade'];
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'sexo': sexo,
      'idede': idade
    };
  }
}

class Documentos {
  String rg;
  String cpf;

  Documentos({this.rg, this.cpf});

  Documentos.fromJson(Map<String, dynamic> json) {
    this.rg = json['rg'];
    this.cpf = json['cpf'];
  }

  Map<String, dynamic> toJson() {
    return {'rg': rg, 'cpf': cpf};
  }
}

class Faculdade {
  String nome;
  int duracao;
  String instituicao;

  Faculdade({this.nome, this.duracao, this.instituicao});

  Faculdade.fromJson(Map<String, dynamic> json) {
    this.nome = json['nome'];
    this.duracao = json['duracao'];
    this.instituicao = json['instituicao'];
  }

  Map<String, dynamic> toJson() {
    return {'nome': nome, 'duracao': duracao};
  }
}

class Endereco {
  String cidade;
  String uf;
  String logradouro;
  String cep;

  Endereco({this.cidade, this.uf, this.logradouro, this.cep});

  Endereco.fromJson(Map<String, dynamic> json) {
    this.cidade = json['cidade'];
    this.uf = json['uf'];
    this.logradouro = json['logradouro'];
  }

  Map<String, dynamic> toJson() {
    return {'cidade': cidade, 'uf': uf, 'logradouro': logradouro};
  }
}

