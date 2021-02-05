//fake API: https://jsonplaceholder.typicode.com/
import 'dart:convert';
import 'package:http/http.dart' as http;

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
    } else {
      throw Exception('Erro ao obter os dados: ${response.statusCode}');
    }
  } catch (e) {
    print('Excecao: e');
  }
}

main() {
  jsonGet();
}
