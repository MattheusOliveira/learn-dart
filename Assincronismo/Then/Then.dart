import '../Future/Future.dart';

/**
 * Conceito
 * - Then registra callbacks que serão chamadas quando o Future for concluído.
 *  > onValue: Valor passado ao término do Future.
 *  > catchError: Se omitido é lançado como uma exception 
 *    > test: Se qualquer lógica retornar true é lançada a exception!
 *  > whenComplete: Chama uma função anonima ao término do Future 
 */

Future<String> tarefa({int tempo = 1}) {
  return status(tempo).then((msg) {
    return '\nStatus: $msg';
  }).catchError(
    (onError) {
      print('CatchError: $onError');
    },
    test: (onError) => onError is! Future && onError.runtimeType != Future,
  ).whenComplete(
    () => {print('Future Complete')},
  );
}

Future<String> status([int tempo]) {
  return Future.delayed(
      Duration(seconds: tempo), () => Future.error('Erro intencional'));
  //return Future.delayed(Duration(seconds: tempo), () => 'Primeira tarefa finaliza!\n');
}

// Função Síncrona
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
  contagem(segundos: 3);

  tarefa(tempo: 4).then((onValue) => print(onValue ?? 'Status: nulo'));
}
