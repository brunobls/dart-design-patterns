abstract class ITransportadora {
  entregar();
}

class PeloAr implements ITransportadora {
  final String tipo;

  PeloAr({
    required this.tipo,
  });

  @override
  entregar() {
    return "pelo ar por $tipo";
  }
}

class PorMar implements ITransportadora {
  final String tipo;

  PorMar({
    required this.tipo,
  });

  @override
  entregar() {
    return "pelo mar por $tipo";
  }
}

abstract class Transporte {
  ITransportadora _gerarTransportador();

  entregarProdutoParaCliente(String cliente) {
    var transportador = _gerarTransportador();

    print(
      "A entrefa foi feita para o cliente $cliente pelo ${transportador.entregar()}",
    );
  }
}

class Navio extends Transporte {
  @override
  ITransportadora _gerarTransportador() {
    return PorMar(tipo: "Navio");
  }
}

class Aviao extends Transporte {
  @override
  ITransportadora _gerarTransportador() {
    return PeloAr(tipo: "Aviao");
  }
}

void main() {
  var cliente1 = "João";
  var transportador1 = Aviao();
  transportador1.entregarProdutoParaCliente(cliente1);

  var cliente2 = "Maria";
  var transportador2 = Navio();
  transportador2.entregarProdutoParaCliente(cliente2);
}
