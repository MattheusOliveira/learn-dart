import 'usuario.dart';

void main() {
  
  Usuario usuario = Usuario('Matheus', 'Oliveira', 26);

  usuario.nome = 'Matheus Oliveira de Moura';

  print(usuario.nome);
  print(usuario.estado_civil);
  print(usuario.idade);

  
}

