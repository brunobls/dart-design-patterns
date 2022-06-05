abstract class Observer {
  void update(double temperatura, double umidade, double pressao);
}

abstract class Subject {
  void registerObserver(Observer observer);
  void removeObserver(Observer observer);
  void notifyObservers();
}

class Estatistica implements Observer {
  final Subject weatherData;
  Estatistica(this.weatherData);

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

class Medidor implements Observer {
  final Subject weatherData;
  Medidor(this.weatherData);

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

class DadosMeteorologicos implements Subject {
  List<Observer> observers = [];
  late double temperatura;
  late double umidade;
  late double pressao;

  @override
  void notifyObservers() {
    for (var observer in observers) {
      observer.update(temperatura, umidade, pressao);
    }
  }

  @override
  void registerObserver(Observer observer) {
    observers.add(observer);
  }

  @override
  void removeObserver(Observer observer) {
    observers.remove(observer);
  }

  void setMedidas(double temperatura, double umidade, double pressao) {
    this.temperatura = temperatura;
    this.umidade = umidade;
    this.pressao = pressao;
    notifyObservers();
  }
}

void main(List<String> args) {
  final dadosMeteorologicos = DadosMeteorologicos();
  final estatistica = Estatistica(dadosMeteorologicos);
  final medidor = Medidor(dadosMeteorologicos);

  dadosMeteorologicos.registerObserver(estatistica);
  dadosMeteorologicos.registerObserver(medidor);

  dadosMeteorologicos.setMedidas(10, 10, 10);
  print('-----------------------------------------');
  dadosMeteorologicos.setMedidas(20, 20, 20);
  print('-----------------------------------------');
  dadosMeteorologicos.setMedidas(30, 30, 30);
}
