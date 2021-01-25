import 'dart:async';

conceito() {
  var lista = List<dynamic>();

  //1) controlador
  var controlador = StreamController<dynamic>();

  //2) stream
  var stream = controlador.stream;

  //3) inscrição de ouvintes na stream
  stream.listen((onData) {
    print('evento: $onData');
    lista.add(onData);
  }, onDone: () {
    //executa apos stream.close();
    print('Stream finalizada');
    print(lista);
  });

  //4) adicionar um envento ao stream
  controlador.sink.add('Matheus');
  controlador.sink.add(36);
  controlador.sink.add(1.83);
  controlador.sink.add(!false);
  controlador.close();

  print('Monitorando..');
}

class Contador {
  var _contagem = 1, termino, erro;
  final _controlador = StreamController<int>();

  Sink<int> get sink => _controlador.sink;
  Stream<int> get stream => _controlador.stream;

  Contador({this.termino = 5, this.erro = 3}) {
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      _contagem < termino ? sink.add(_contagem) : sink.close();
      _contagem++;
      if (_contagem == erro) _controlador.addError('Erro intencional');
      if (_contagem == termino) timer.cancel();
    });
  }
}

model() {
  //stream
  var minhaStream = Contador(termino: 5, erro: 3).stream.asBroadcastStream();

  //inscrição de ouvintes na stream
  final inscrito1 = minhaStream.listen(
    (onData) {
      print('Inscrito1: $onData');
    },
    onError: (erro) => {print('Inscrito1: $erro')},
    onDone: () {
      print('Inscrito1: Completo!');
    },
  );
  var pares = (e) => e % 2 == 0;
  var mapear = (e) => '$e é par';

  //modificar eventos
  final inscrito2 = minhaStream.where(pares).map(mapear).listen(
        (onData) {
          print('Inscrito2: $onData');
        },
        onError: (erro) => {print('Inscrito2: $erro')},
        onDone: () {
          print('Inscrito2: Completo!');
        },
      );

  //gerenciar inscritos
  for (var i = 1; i <= 3; i++) {
    Future.delayed(Duration(seconds: i), () {
      if (i == 1) inscrito1.pause();
      if (i == 2) inscrito1.resume();
      if (i == 3) inscrito1.cancel();
    });
  }
}

metodos() async {
  //Stream Métodos e ouvintes
  var stream = Stream<dynamic>.periodic(Duration(seconds: 1), (e) => e + 1)
      .take(5)
      .asBroadcastStream();

  stream = stream
      .takeWhile((e) => e <= 5)
      .skipWhile((e) => e > 3)
      .map((e) => e.toString().padLeft(2, '0'));

  //ouvintes
  stream.listen((onData) {
    print('listen: $onData');
  }, onDone: () {
    print('contagem finalizada!');
  });

  stream.forEach((element) => print('ForEach: $element'));

  await for (dynamic evento in stream) {
    print('forIn: $evento');
  }

  List<dynamic> eventos = await stream.toList();
  print(eventos);

  Future<List<dynamic>> eventosFuturos = stream.toList();
  print(await eventosFuturos);
}

void main() {
  //conceito();
  //model();
  metodos();
}
