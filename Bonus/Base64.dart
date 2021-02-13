/**
 * Conceito
 * utf8 
 *  - Binário que representa qualquer caractere universal
 * 
 * Base64
 *  - Codificação de dados para transferência na Internet
 *  - https://www.base64encode.ort/
 */
import 'dart:convert';

main() {
  String email = 'mattheus.demoura@gmail.com';

  // ENCODE
  List ebytes = utf8.encode(email);
  print('ebytes: $ebytes');
  String codificado = base64.encode(ebytes);
  print('codificado: $codificado');

  //DECODE
  List dbytes = base64.decode(codificado);
  print('dbytes: $dbytes');
  String decodificado = utf8.decode(dbytes);
  print('decodificado: $decodificado');
}