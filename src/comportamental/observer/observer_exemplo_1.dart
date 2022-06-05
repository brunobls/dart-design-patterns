abstract class IAssinante {
  void update(double temperatura, double umidade, double pressao);
}

abstract class IPublicador {
  void registerAssinante(IAssinante assinante);
  void removeAssinante(IAssinante assinante);
  void notifyAssinantes();
}

class DadosMeteorologicos implements IPublicador {
  final List<IAssinante> _assinantes = [];
  late double temperatura;
  late double umidade;
  late double pressao;

  @override
  void notifyAssinantes() {
    for (var assinante in _assinantes) {
      assinante.update(temperatura, umidade, pressao);
    }
  }

  @override
  void registerAssinante(IAssinante assinante) {
    _assinantes.add(assinante);
  }

  @override
  void removeAssinante(IAssinante assinante) {
    _assinantes.remove(assinante);
  }

  void setMedidas(double temperatura, double umidade, double pressao) {
    this.temperatura = temperatura;
    this.umidade = umidade;
    this.pressao = pressao;
    notifyAssinantes();
  }
}

class Estatistica implements IAssinante {
  final IPublicador dadosMeteorologicos;
  Estatistica(this.dadosMeteorologicos);

  @override
  void update(double temperatura, double umidade, double pressao) {
    print(
      'Estatística ->'
      ' Temperatura média: ${temperatura.toStringAsFixed(1)}'
      ' Umidade média: ${umidade.toStringAsFixed(1)}'
      ' Pressão média: ${pressao.toStringAsFixed(1)}',
    );
  }
}

class Medidor implements IAssinante {
  final IPublicador dadosMeteorologicos;
  Medidor(this.dadosMeteorologicos);

  @override
  void update(double temperatura, double umidade, double pressao) {
    print(
      'Medidor ->'
      ' Temperatura: ${temperatura.toStringAsFixed(1)}'
      ' Umidade: ${umidade.toStringAsFixed(1)}'
      ' Pressão: ${pressao.toStringAsFixed(1)}',
    );
  }
}

void main(List<String> args) {
  final dadosMeteorologicos = DadosMeteorologicos();
  final estatistica = Estatistica(dadosMeteorologicos);
  final medidor = Medidor(dadosMeteorologicos);

  dadosMeteorologicos.registerAssinante(estatistica);
  dadosMeteorologicos.registerAssinante(medidor);

  dadosMeteorologicos.setMedidas(10, 10, 10);
  print('-----------------------------------------');
  dadosMeteorologicos.setMedidas(20, 20, 20);
  print('-----------------------------------------');
  dadosMeteorologicos.setMedidas(30, 30, 30);
}
