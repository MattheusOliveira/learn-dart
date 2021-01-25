import 'dart:convert';

import 'dart:math';

/**
 * Conceito:
 *  - List é uma coleção dinâmica e ordenada de elementos entre colchetes []
 *  - ForEach: Aplica a função anônima a cada elemento de nossa coleção
 *  - Todo Array é um List<?>
 */

listForEach() {
  var array = [0, 2.5, 5, 7.5, 10];

  array.forEach((element) {
    print('forEach: $element');
  });

  List<int> inteiros = [1, 5, 10];
  List<double> doubles = [2.5, 7.25];
  List<bool> boleanas = [true, false, !true, !false];
  List<String> frutas = ['morango', 'Banana', 'Tomates'];

  print('\nimplementação: ${frutas.runtimeType}');

  frutas.insert(0, 'Abacaxi');
  frutas.add('Laranja');
  frutas.forEach((e) => print('frutas: $e'));
  print(frutas);
  frutas.removeLast(); //remove o ultimo elemento
  frutas.removeWhere((element) => element == 'Banana'); //remove sob condição
  print(frutas);
  print(frutas.elementAt(2));
  print(frutas.contains('abacaxi')); //camelcase

  List<num> numeros = List.from(inteiros)
    ..addAll(doubles)
    ..shuffle()
    ..sort();
  print('\n$numeros');

  List<dynamic> lista = List(2); //fixa o número de elementos
  lista = numeros.take(3).skip(1).toList();
  print('lista: $lista');

  //geradores de lista
  List<String> listaPreenchida = List.filled(2, 'elemento');
  List<String> listaGerada = List.generate(2, (i) => 'Nome $i');
  List<double> listaPrecos = List.generate(
      5,
      (i) =>
          double.parse(((i + 1) * Random().nextDouble()).toStringAsFixed(2)));
  print(
      'listaPreenchida: $listaPreenchida \nListaGerada: $listaGerada \nListaPreços: $listaPrecos');

  listaPrecos.forEach((element) {
    print('forEach: $element');
  });
}

/**
 * Expand:
 * - Cria uma nova lista expandindo ou concatenando os elementos
 */

listExpand() {
  var lista = [
    [1, 2],
    [3, 4]
  ];

  List<dynamic> listaFlat =
      lista.expand((elemento) => elemento).toList(); //concatenar listas
  List<dynamic> listaDuplicada = listaFlat.expand((e) => [e, e]).toList();
  print('ListaFlat: $listaFlat \nListaDuplicada: $listaDuplicada');

  List<num> numeros = [1, 2.5, 5, 7.25, 10];
  List<int> inteiros = [1, 5, 10];
  List<double> doubles = [2.5, 7.25];

  List<dynamic> listaDinamica = List(1);
  print('$listaDinamica');
  print(listaDinamica = [1, 5, 10] + [2, 7]); //concatenar listas;
  print(listaDinamica = []..addAll(inteiros)..addAll(doubles));

  print(listaDinamica = [0, ...inteiros, 15]);
  print(listaDinamica = [
    ...[],
    ...inteiros,
    if (doubles is List<double>) ...doubles
  ]);

  print(listaDinamica = [...[], for (var numero in numeros) numero]);
}

listaMap() {
  List<String> frutas = ['morango', 'maca', 'mamao'];
  List<String> frutasMapeadas =
      frutas.map((e) => '$e frutas mapeadas').toList();
  print(frutasMapeadas);

  List<int> inteiros = [1, 2, 3, 7];
  var incremento = (int e) => ++e;
  var dobro = (int e) => e * e;

  List<int> newInteiros = inteiros.map(incremento).map(dobro).toList();
  print(newInteiros);
}

listaEvery() {
  List<int> inteiros = [0, 4, 6, 9];
  bool res = inteiros.every((e) => e >= 0);
  print(res);

  List<String> nomes = List.from(['matheus', 'marcia', 'michiele']);
  bool res2 = nomes.every((e) => e.contains('m'));
  print(res2);
}

/**
 * Where:
 *  - Filtra os elementos da coleção criando uma nova do mesmo tamanho ou menor
 */
listaWhere() {
  List<int> idades = [4, 10, 32, 26, 81];

  print(idades.where((element) => element > 2)); //retorna um iterable

  List<int> deMenores = idades.where((int e) => e > 15).toList();
  print(deMenores);

  var crianca = idades.singleWhere((int e) => e < 2, orElse: () => 0);
  print(crianca);

  var i = idades.lastWhere((int e) => e.toString().startsWith('5'),
      orElse: () => null);
  print(i); //null
}

/**
 * Reduce: 
 *  - Compara os elementos retornando 1 único elemento resultante
 *  - Ao interagir com os elementos o indice 0 se torna o anterior, indice 1 se torna o atual.
 */
listReduce() {
  List<int> numeros = List.generate(6, (index) => index * 2);
  print(numeros);

  var resultado = numeros.reduce((anterior, atual) {
    print('$anterior + $atual');
    return anterior + atual;
  });

  print('resultado: $resultado');
}

/**
 * Fold :
 * - Compara os elementos da coleção retornando 1 unico elemento resultante!
 * - O valor inicial se torna o anterior e o índice 0 se torna o atual
 */

listFold() {
  List<int> numeros = List.generate(6, (index) => index * 2);
  print(numeros);
  int valorInicial = 10;
  var resultado = numeros.fold(valorInicial, (anterior, atual) {
    print('$anterior + $atual');
    return anterior + atual;
  });

  print(resultado);
}

void main() {
  //listForEach();
  //listExpand();
  //listaMap();
  //listaEvery();
  //listaWhere(); filter
  //listReduce();
  listFold();
}
