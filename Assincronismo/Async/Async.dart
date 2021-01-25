import '../Future/Future.dart';

/**
 * - Síncrona:
 *  - Operações síncronas: Bloqueia a execução até que seja conclúida
 *  - Funções síncrona: Executa somente operações síncronas
 * 
 * - Assíncrona:
 *  - Operações assíncronas: Permite executar outras operações nequanto são processadas.
 *  - Funções assíncronas: Executam ao menos uma operação assíncrona e operações síncronas.
 * 
 * - Await: 
 *  - Indica a espera de uma operação assincrona, conclusão de uma future!
 * 
 * - Async:
 *  - Deve ser usado em toda função que tenha operações assíncronas, isto é, await. 
 */

Future<String> tarefa({int tempo = 1}) async {
  var msg = await status(tempo);
  return 'Status: $msg';
}

Future<String> status([int tempo]) {
  //tempo é opcional
  try {
    //Future.error('Tempo insuficiente para o Load programado'); // NÃO é possíve tratar Future.error em tryCatch
    if (tempo < 4) throw Exception('Tempo insuficiente para o Load programado');
    return Future.delayed(
        Duration(seconds: tempo), () => 'Primeira tarefa finaliza!\n');
  } catch (e) {
    print('catch $e');
    return null;
  }
}

void main() async {
  contagem(segundos: 3); //função síncrona

  print(await tarefa(tempo: 3));
}
