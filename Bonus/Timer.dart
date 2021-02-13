import 'dart:async';

int contador = 0;

String tempoAgora() {
  DateTime tempo = DateTime.now();
  String hora = '${tempo.hour}:${tempo.minute}:${tempo.second}:${tempo.microsecond}';
  return hora;  
}

void main() {
  print('compilado as: ${tempoAgora()}');

  Timer.run(() => print('Executado as ${tempoAgora()}'));

  Timer(Duration(seconds: 2),() => print('Apos 2 segundos: ${tempoAgora()}'));

  Timer.periodic(Duration(seconds: 1), (timer) { 
    contador++;
    if(contador == 4) print('Após 4 segundos ${tempoAgora()}');
    if(contador == 6) {
      print('Após 6 segundos ${tempoAgora()}');
      timer.cancel();
    };
  });
}