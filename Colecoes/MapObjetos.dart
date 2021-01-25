class Carro {
  String marca, modelo;
  Carro(this.marca, this.modelo);

}

void main() {
  Carro c1 = Carro('Honda', 'Civic');
  Carro c2 = Carro('Ford', 'Ka');
  Carro c3 = Carro('GM', 'Onix');
  Map<String,Carro> carros = {'0': c1, '1': c2 };
  carros['2'] = c3;

  for(var i= 0; i < carros.length; i++) {
    print('for: $i ${carros['$i'].modelo}');
  }

  for(String key in carros.keys) {
    final carro = carros[key];
    print('for in: $key ${carro.modelo}'); 
  }

  carros.forEach((key, value) => print('forEach: $key ${value.modelo}'));
  
}