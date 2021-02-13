class Pessoa {
  String nome;
  DateTime _data, _nascimento, _agora = DateTime.now();

  Pessoa(this.nome, int diaNasc, int mesNasc, int anoNasc, {int horas = 0, int minutos = 0}) {
    this._nascimento = DateTime.utc(anoNasc, mesNasc, diaNasc, horas, minutos);
    print('$nome nascido em $diaNasc/$mesNasc/$anoNasc ${diaSemana(_nascimento.weekday)} as $horas:$minutos ano ${bissexto(anoNasc)}');
    fecundacao();
    tempo();
  }

  fecundacao() {
    int gestacaoMedia = 268;
    _data = _nascimento.subtract(Duration(days: gestacaoMedia));
    print('Data estimada de fecundação: ${_data.day}/${_data.month}/${_data.year} ${diaSemana(_nascimento.weekday)}');
  }

  tempo() {
    print(''' Tem ${idade().toStringAsFixed(0)} anos e está vivo a:
    ${_agora.difference(_nascimento).inDays} dias...
    ${_agora.difference(_nascimento).inHours} horas...
    ${_agora.difference(_nascimento).inMinutes} minutos...
    ${_agora.difference(_nascimento).inSeconds} segundos...
    ''');
  }
  
  String bissexto(int ano) => (ano % 4 == 0 || ano % 400 == 0 && ano % 100 != 0) ? 'é bissexto' : 'não é bissexto';

  double idade() => _agora.difference(_nascimento).inDays /360;

  String diaSemana(int dia) {
    switch (dia) {
      case 1:
        return 'segunda-feira';
        break;
      case 2:
        return 'terça-feira';
        break;
      case 3:
        return 'quarta-feira';
        break;
      case 4:
        return 'quinta-feira';
        break;
      case 5:
        return 'sexta-feira';
        break;
      default:
        return '';
    }
  }
}

void main() {
  Pessoa p1 = Pessoa('Matheus', 10,9,1994, horas: 16, minutos: 30);
}