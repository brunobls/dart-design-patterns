abstract class IRota {
  contruir(String origem, String destino);
}

class RotaDeCarro implements IRota {
  @override
  contruir(String origem, String destino) {
    print('Rota de carro: de $origem - $destino em 30min');
  }
}

class RotaDeOnibus implements IRota {
  @override
  contruir(String origem, String destino) {
    print('Rota de ônibus: de $origem - $destino em 1h');
  }
}

class RotaDeDrone implements IRota {
  @override
  contruir(String origem, String destino) {
    print('Rota de drone: de $origem - $destino em 10min');
  }
}

class Navegador {
  final IRota rota;

  Navegador(this.rota);

  void navegar(String origem, String destino) {
    rota.contruir(origem, destino);
  }
}

void main(List<String> args) {
  Navegador navegador = Navegador(RotaDeCarro());
  navegador.navegar('São Paulo', 'Rio de Janeiro');

  navegador = Navegador(RotaDeOnibus());
  navegador.navegar('São Paulo', 'Rio de Janeiro');

  navegador = Navegador(RotaDeDrone());
  navegador.navegar('São Paulo', 'Rio de Janeiro');
}
