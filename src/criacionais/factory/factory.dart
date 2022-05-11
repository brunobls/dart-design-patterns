abstract class ILogistica {
  entregar();
}

class LogisticaViaria implements ILogistica {
  final String tipo;

  LogisticaViaria({
    required this.tipo,
  });

  @override
  entregar() {
    return "pela terra por $tipo";
  }
}

class LogisticaMaritima implements ILogistica {
  final String tipo;

  LogisticaMaritima({
    required this.tipo,
  });

  @override
  entregar() {
    return "pelo mar por $tipo";
  }
}

abstract class Transporte {
  ILogistica _gerarTransportador();

  entregarProdutoParaCliente(String cliente) {
    var transportador = _gerarTransportador();

    print(
      "A entrega foi feita para o cliente $cliente ${transportador.entregar()}",
    );
  }
}

class Navio extends Transporte {
  @override
  ILogistica _gerarTransportador() {
    return LogisticaMaritima(tipo: "Navio");
  }
}

class Caminhao extends Transporte {
  @override
  ILogistica _gerarTransportador() {
    return LogisticaViaria(tipo: "Caminhão");
  }
}

void main() {
  var cliente1 = "João";
  var transportador1 = Caminhao();
  transportador1.entregarProdutoParaCliente(cliente1);

  var cliente2 = "Maria";
  var transportador2 = Navio();
  transportador2.entregarProdutoParaCliente(cliente2);
}
