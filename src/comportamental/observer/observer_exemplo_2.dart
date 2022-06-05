enum CategoriaDeProduto {
  informatica("Informática"),
  eletronicos("Eletrônicos"),
  moveis("Móveis"),
  brinquedos("Brinquedos"),
  limpeza("Limpeza"),
  saude("Saúde"),
  higiene("Higiene"),
  vestuario("Vestuário"),
  outros("Outros");

  final String nome;
  const CategoriaDeProduto(this.nome);

  @override
  String toString() => nome;
}

class Produto {
  String nome;
  double preco;
  CategoriaDeProduto categoria;
  Produto({
    required this.nome,
    required this.preco,
    required this.categoria,
  });
}

abstract class IAssinante {
  late List<CategoriaDeProduto> categoriasComInteresse;
  void atualizar(Produto produto);
}

abstract class IPublicador {
  void adicionarAssinante(IAssinante assinante);
  void removerAssinante(IAssinante assinante);
  void notificarAssinantes();
}

class NewsletterAmazon implements IPublicador {
  List<IAssinante> assinantes = [];
  late Produto produto;

  @override
  void adicionarAssinante(IAssinante assinante) {
    assinantes.add(assinante);
  }

  @override
  void removerAssinante(IAssinante assinante) {
    assinantes.remove(assinante);
  }

  @override
  void notificarAssinantes() {
    for (var assinante in assinantes.where(
      (e) => e.categoriasComInteresse.contains(
        produto.categoria,
      ),
    )) {
      assinante.atualizar(produto);
    }
  }

  void setProduto({required Produto produto}) {
    this.produto = produto;
    notificarAssinantes();
  }
}

class Pessoa implements IAssinante {
  final IPublicador newsletter;
  final String nome;

  @override
  List<CategoriaDeProduto> categoriasComInteresse;

  Pessoa({
    required this.nome,
    required this.newsletter,
    required this.categoriasComInteresse,
  });

  @override
  void atualizar(Produto produto) {
    print(
      'Notificado o(a) $nome sobre a chegada do novo produto: (nome: ${produto.nome} preço: ${produto.preco} categoria: ${produto.categoria.toString()})',
    );
  }
}

void main(List<String> args) {
  final newsletter = NewsletterAmazon();

  newsletter.adicionarAssinante(Pessoa(
    nome: 'João',
    newsletter: newsletter,
    categoriasComInteresse: [
      CategoriaDeProduto.informatica,
      CategoriaDeProduto.eletronicos,
      CategoriaDeProduto.moveis,
    ],
  ));

  newsletter.adicionarAssinante(Pessoa(
    nome: 'Maria',
    newsletter: newsletter,
    categoriasComInteresse: [
      CategoriaDeProduto.informatica,
      CategoriaDeProduto.eletronicos,
      CategoriaDeProduto.limpeza,
    ],
  ));

  newsletter.adicionarAssinante(Pessoa(
    nome: 'Ana',
    newsletter: newsletter,
    categoriasComInteresse: [
      CategoriaDeProduto.informatica,
      CategoriaDeProduto.eletronicos,
      CategoriaDeProduto.saude,
    ],
  ));

  newsletter.adicionarAssinante(Pessoa(
    nome: 'José',
    newsletter: newsletter,
    categoriasComInteresse: [
      CategoriaDeProduto.informatica,
      CategoriaDeProduto.eletronicos,
      CategoriaDeProduto.vestuario,
    ],
  ));

  newsletter.setProduto(
    produto: Produto(
      nome: 'Monitor de 19"',
      preco: 1500.0,
      categoria: CategoriaDeProduto.eletronicos,
    ),
  );

  print('\n');

  newsletter.setProduto(
    produto: Produto(
      nome: 'Teclado',
      preco: 100.0,
      categoria: CategoriaDeProduto.informatica,
    ),
  );

  print('\n');

  newsletter.setProduto(
    produto: Produto(
      nome: 'Fogão',
      preco: 800.0,
      categoria: CategoriaDeProduto.moveis,
    ),
  );

  print('\n');

  newsletter.setProduto(
    produto: Produto(
      nome: 'Complexo de vitaminas',
      preco: 200.0,
      categoria: CategoriaDeProduto.saude,
    ),
  );
}
