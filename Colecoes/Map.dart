
/**
 * -Map é uma coleção dinâmica e costumizável de chaves e valores entre {}. 
 *  - As chaves são ÚNICAS, e os valores não se repetem.
 */
linkedHashMap() {
  List<String> nomes = ['Matheus', 'Moura'];
  Map<int,String> nomesMap = nomes.asMap(); // Converte uma lista em um map
  print('$nomesMap');
  nomesMap.forEach((key, value) => print('$key: $value'));

  Map<String, dynamic> frutas = Map();
  frutas['banana'] = 'amarela';
  frutas['banana'] = 'verde';
  frutas['goiaba'] = 'amarela';
  frutas['maca'] = 'vermelho';
  print(frutas);
  print(frutas.containsKey('banana'));
  print(frutas.containsValue('vermelho'));
  print(frutas['banana']); //acessa o valor de uma chave
  frutas.clear(); //limpa a coleção
  print(frutas);
  frutas[null] = null;
  print(frutas);

  Map<String, dynamic> usuario = Map.from({'nome': 'Matheus', 'idade': 26, 'peso': 75});
  usuario.update('nome', (value) => '$value Oliveira');
  usuario.update('idade', (value) => ++value);
  usuario.update('peso', (value) => 78, ifAbsent: () => 'indefinido');
  print(usuario);
  usuario.removeWhere((key, value) => key == 'peso' && value == 78);
  usuario.update('peso', (value) => 70, ifAbsent: () => 'indefinido');
  usuario.putIfAbsent('altura', () => 1.70);
  usuario.addAll({'sexo': 'masculino', 'casado': true});
  print('$usuario');
  print('chaves: ${usuario.keys} \nValores\n${usuario.values}');

  Map<int, dynamic> numeros = {0: 'zero', 1: 'um', 2: 'dois'};
  print(numeros);
  print(numeros.map((key, value) => MapEntry(key, '${value.toUpperCase()}'))); //MapEntry mapeia a key e o value de uma iteração do tipo map
  
  for(var chave in numeros.keys) {
    print('forIn: $chave');
  }
  for(var valor in numeros.values) {
    print('forIn: $valor');
  }
  for(var key in numeros.keys) {
    var valor = numeros[key];
    print('forIn: chave $key valor ${valor.toUpperCase()}');
  }
}

/**
 * Map: transforma/seleciona os elementos de uma coleção criando 
 * uma nova do mesmo tamanho
 */
mapMap() {
  List<Map<String, dynamic>> carrinho = [
    {'nome': 'borracha', 'preco': 1.45},
    {'nome': 'caderno', 'preco': 8.45},
    {'nome': 'canetinha', 'preco': 16.45},
    {'nome': 'lapis', 'preco': 23.45},
  ];

  Function porcentagem(desconto) => (valor) => desconto * valor['preco'];
  final moeda = (e) => 'RS ${e.toDouble().toStringAsFixed(2).replaceFirst('.',',')}';
  List<String> preco1 = carrinho.map(porcentagem(0.9)).map(moeda).toList();
  List<String> preco2 = carrinho.map((e) => e.update('preco', (e) => e *.9)).map(moeda).toList();
  String precoMedio = (carrinho.map((e) => e['preco']).reduce((ant, act) => ant + act) / carrinho.length).toStringAsFixed(2);
  print('Lista preco1: $preco1\n Lista preco2: $preco2\n Preço Médio: $precoMedio');


  List<Map<String,Object>> escola = [
    {
      'nome': 'Turma A',
      'alunos': [
        {'nome':'Matheus', 'nota': 9},
        {'nome':'Fulano', 'nota': 7},
      ]
    },
    {
      'nome': 'Turma B',
      'alunos': [
        {'nome':'Paulina', 'nota': 6.5},
        {'nome':'Lucrécia', 'nota': 10},
      ]
    }
  ];

  List<dynamic> alunosEscolas = escola.map((e) => e['alunos']).expand((e) => e).toList();
  print('alunos escola: $alunosEscolas'); 
  alunosEscolas.sort((b,a) => a['nota'].compareTo(b['nota']));
  print('alunos escola: $alunosEscolas');
  double mediaNotas = alunosEscolas.map((e) => e['nota']).reduce((ant, act) => ant + act) / alunosEscolas.length;
  print('Média alunos: $mediaNotas');
  alunosEscolas.forEach((e) => print('nome: ${e['nome']}  nota: ${e['nota']}'));
  
}

/**
 * - Every faz o teste em todos elementos com o separador 
 * lógico && retornando true ou false;
 */

everyMap() {
  List<Map<String,dynamic>> pessoas = [
    {'nome': 'Matheus', 'idade': 26},
    {'nome': 'Larissa', 'idade': 26},
    {'nome': 'Rafael', 'idade': 17},
  ];
  
  print(pessoas.every((e) => e.containsKey('nome')));
  print(pessoas.every((e) =>e['idade'] >17));
  bool maiores = pessoas.every((element) => element['nome'].startsWith('L'));
  print('maiores: $maiores');
}

/**
 * Where filtra os elementos da coleção criando um nova do mesmo
 * tamanho ou menor!
 */

whereMap() {
  List<Map<dynamic,dynamic>> produtos = [
  {'nome': 'smartphone', 'preco': 1357, 'fragil': true},
  {'nome': 'MacBook pro', 'preco': 5000, 'fragil': true},
  {'nome': 'mi band', 'preco': 150, 'fragil': true},
  {'nome': 'mouse', 'preco': 49, 'fragil': false},
];

var fragil = (e) => e['fragil'] == true;
var nome = (e) => e['nome'];

List<dynamic> resultado = produtos.where(fragil).map(nome).toList();
print('resultado: $resultado');

List<Map<String, dynamic>> pessoas = [
  {'nome': 'Matheus', 'idade': 26},
  {'nome': 'Leandro', 'idade': 49},
  {'nome': 'Augusta', 'idade': 77},
];

List<Map<String,dynamic>> maiores = pessoas.where((element) => element['idade'] > 50).toList();
Map<String,dynamic> comecaM = pessoas.firstWhere((element) => element['nome'].startsWith('M'), orElse: () => null);
final Function idade = (e) => e['idade'];
final Function soma = (ant, act) => ant + act;

var media = (pessoas.map(idade).reduce(soma) / pessoas.length).toStringAsFixed(2);
print('Maiores: $maiores  \nMedia: $media\n Nomes com M: ${comecaM ?? 'nenhum'}');
}

/**
 * - Reduce compara os elementos da coleção retornando 1 unico
 * elemento resultante! 
 * - Ao interagir com os elmeentos o indice 0 se torna o anterior e o
 * indíce 1 se torna o atual.
 */

reduceMap() {
  List<Map<String,dynamic>> alunos = [
    {'nome':'Paulina', 'nota': 6.5, 'bolsista': false},
    {'nome':'Lucrécia', 'nota': 10, 'bolsista': true},
    {'nome':'Barbara', 'nota': 8, 'bolsista': true},
    {'nome':'Priscila', 'nota': 5, 'bolsista': false},
  ];
  final Function bolsistas = (e) => e['bolsista'] as bool;
  final Function nomes = (e) => e['nome'];
  final Function notas = (e) => e['nota'];
  final Function soma = (ant, act) => ant + act;
  
  List<dynamic> bolsitasNomes = alunos.where(bolsistas).map(nomes).toList();
  print(bolsitasNomes);
  List<Map<String,dynamic>> medias = alunos.where(bolsistas).toList();
  var bolsitasMedia = medias.map(notas).reduce(soma) / medias.length;
  bool todosBolsitas = alunos.map(bolsistas).reduce((ant, act) => ant && act);
  bool algumBolsista = alunos.map(bolsistas).reduce((ant, act) => ant || act);
  print('Todos bolsitas: ${todosBolsitas ? 'sim' : 'não'} Algum bolsitas: ${algumBolsista ? 'sim' : 'não'}');
  print('Alunos bolsitas: $bolsitasNomes média: $bolsitasMedia');

  List<dynamic> funcionarios = [
    {'nome': 'Leila', 'genero': 'M', 'pais': 'Brasil', 'salario': 5000},
    {'nome': 'Larissa', 'genero': 'M', 'pais': 'Brasil', 'salario': 2000},
    {'nome': 'Matheus', 'genero': 'H', 'pais': 'Brasil', 'salario': 2500},
    {'nome': 'Leandro', 'genero': 'H', 'pais': 'Brasil', 'salario': 1800},
  ];

  final Function brasileiros = (e) => e['pais'] == 'Brasil';
  final Function mulheres = (e) => e['genero'] == 'M';
  final Function menorSalario = (ant,act) => ant['salario'] < act['salario'] ? ant['salario'] : act['salario']; 
  final Function funcMenorSalario = (ant,act) => ant['salario'] < act['salario'] ? ant : act;
  List<dynamic> selecionados = funcionarios.where(brasileiros).where(mulheres).toList();
  print(selecionados);
  print(selecionados.reduce(menorSalario));
  Map<String,dynamic> funcionario = selecionados.reduce(funcMenorSalario);
  print('Funcionario: ${funcionario['nome']} salario: ${funcionario['salario']}');
  
}

void main() {
  //linkedHashMap();
  //mapMap();
  //everyMap();
  //whereMap();
  reduceMap();
}