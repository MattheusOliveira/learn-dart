//fake API: https://jsonplaceholder.typicode.com/
import 'dart:convert';
import 'package:fake_api/models/People.dart';
import 'package:fake_api/models/Posts.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';


import 'package:fake_api/models/Users.dart';
//video 12:17

jsonGet() async {
  String url = 'https://jsonplaceholder.typicode.com/users';

  try {
    var response = await http.get(url);
    if (response.statusCode == 200) {
      print('statusCode: ${response.statusCode}');

      //DECODE
      List<dynamic> parsedJson = jsonDecode(response.body);
      print('parsedJson: ${parsedJson}');

      var obj = Users.fromJson(parsedJson);

      print(obj.users.map((e) => e.company.name).toList());

      //ENCODE
      List<dynamic> map = obj.toJson();

      String toJson = jsonEncode(map);

      print('toJson: $toJson');
    } else {
      throw Exception('Erro ao obter os dados: ${response.statusCode}');
    }
  } catch (e, s) {
    print('Excecao: $e');
    print('Stack trace: $s');
  }
}

jsonPost() async {
  var url = 'https://jsonplaceholder.typicode.com/users';

  Map<String, dynamic> parsedJson = {
    'title': 'Dart',
    'body': 'Modificação feita por Matheus',
    'userId': 1
  };
  //DECODE
  var objeto = Posts.fromJson(parsedJson);

  //ENCODE
  String toJson = jsonEncode(objeto);

  try {
    var response = await http.post(
      url,
      body: toJson,
      headers: {
        'Content-type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('statusCode: ${response.statusCode}\n');
      print('resposta: ${response.body}');
    } else {
      throw Exception('Erro na resposta, statusCode: ${response.statusCode}');
    }
  } catch (e) {
    print(e);
  }
}

jsonPut() async {
  var url = 'https://jsonplaceholder.typicode.com/posts/1';

  Map<String, dynamic> parsedJson = {
    'id': 1,
    'title': 'Dart',
    'body': 'Modificação realizada!',
    'userId': 90
  };
  //DECODE
  var objeto = Posts.fromJson(parsedJson);

  //ENCODE
  String toJson = jsonEncode(objeto);

  try {
    var response = await http.put(
      url,
      body: toJson,
      headers: {
        'Content-type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      print('statusCode: ${response.statusCode}\n');
      print('resposta: ${response.body}');
    } else {
      throw Exception('Erro na resposta, statusCode: ${response.statusCode}');
    }
  } catch (e) {
    print(e);
  }
}

jsonPatch() async {
  var url = 'https://jsonplaceholder.typicode.com/posts/1';

  Map<String, dynamic> parsedJson = {
    'id': 1,
    'title': 'Dart',
    'userId': 90
  }; //remoção da chave/valor body
  //DECODE
  var objeto = Posts.fromJson(parsedJson);

  //ENCODE
  String toJson = jsonEncode(objeto);

  try {
    var response = await http.patch(
      url,
      body: toJson,
      headers: {
        'Content-type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      print('statusCode: ${response.statusCode}\n');
      print('resposta: ${response.body}');
    } else {
      throw Exception('Erro na resposta, statusCode: ${response.statusCode}');
    }
  } catch (e) {
    print(e);
  }
}

jsonDelete() async {
  var url = 'https://jsonplaceholder.typicode.com/posts/1';

  try {
    var response = await http.delete(url);

    if (response.statusCode == 200) {
      print('statusCode: ${response.statusCode}\n');
      print('resposta: ${response.body}');
    } else {
      throw Exception('Erro na resposta, statusCode: ${response.statusCode}');
    }
  } catch (e) {
    print(e);
  }
}

dioRequest() async {
  const url ='https://run.mocky.io/v3/d224a724-7f56-4629-ae94-e6b5455af293';
  BaseOptions options = new BaseOptions(baseUrl: url);
  
  Dio dio = new Dio(options);
  var response = await dio.get('');
  print('data: ${response.data}');

  //var parsedJson = jsonDecode(response.data);
  //print('parsed: $parsedJson'); 
  //A lib Dio já retorna um Map ou List<Map> não precisando efetuar o decode
  Employer employer = Employer.fromJson(response.data);
  print(employer.data.map((e) => e.id).toList());

  Map<String,dynamic> desserializacao = employer.toJson();
  var json = jsonEncode(desserializacao);
  print('json: $json');
}

void main() {
  //jsonGet();
  //jsonPost();
  //jsonPut();
  //jsonPatch();
  //jsonDelete();

  //Dio
  dioRequest();
}
