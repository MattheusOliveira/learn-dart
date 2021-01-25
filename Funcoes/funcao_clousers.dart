//Clouser acontece quando uma função é executada dentro de uma outra função
//podendo imprimir variáveis locais e superiores a função

callClouser() {
  var res = (String nome) {
    var resComplete = (message) => print('O nome é ${nome}, ${message}');
    resComplete('Seja bem vindo!');
  };

  res('Matheus');

  //clouser com retorno:
  Function somar(int valor1) {
    //print(valor1); Primeiro é retornado a função já com o valor1 implicito
    return (valor2) {
      return (valor1 + valor2);
    };
  }
  var somarValor = somar(10);
  print(somarValor(5));

  //clouser sem retorno:
  Function descontar = (porcentagem) => (valor) => porcentagem * valor;

  var descontar10 = descontar(.9);

  print(descontar10(100)); 
  
  //clouser com retorno de objeto:
  var novoObjeto = () {
    var id = 0;
    var objetoCriado = (String nome, descricao) {
      //return 'id: ${++id} nome: ${nome}, descrição: ${descricao}';
      return {'id':++id, 'nome':nome, 'descricao': descricao};
    };
    return objetoCriado;
  }; 

  var objeto = novoObjeto();
  
  var lista = [objeto('Matheus', 10.0)];
  lista.add(objeto('Leandro', 39.0));
  lista.add(objeto('Pedro Américo', 100.0));
  lista.add(objeto('Rafael', 999.9));

  for (var objeto in lista) {
    print(objeto.map((c,v) => MapEntry(c, (v is double) ? '${descontar10(v)}w' : v)));
  }  
}

void main() {
  callClouser();
}