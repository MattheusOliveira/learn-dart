/**
 * Future: É objeto que retorna um valor ou erro de uma execução assíncrona/futura
 * 
 */

String tarefa({int tempo = 1}) {
  var msg = status(tempo);
  return 'Status: $msg';
}

Future<String> status([int tempo]) {
  //tempo é opcional
  return Future.delayed(
      Duration(seconds: tempo), () => 'Primeira tarefa finaliza!\n');
}

void novaTarefa({int tempo = 1}) {
  Future.delayed(Duration(seconds: tempo),
      () => print('\nStatus: Segunda tarefa finalizada'));
}

excecao({int tempo = 1}) => Future.delayed(
    Duration(seconds: tempo), () => throw Exception('Erro intencional'));

void contagem({int segundos = 3}) {
  print('contagem...');

  for (var i = 1; i <= segundos; i++) {
    Future.delayed(Duration(seconds: i), () {
      print('${i * 33}%');
      if (i == segundos) print('\n Concluído!');
    });
  }
}

void main() {
  print(tarefa(tempo: 4));

  novaTarefa(tempo: 4);

  excecao(tempo: 6);

  contagem();
}
