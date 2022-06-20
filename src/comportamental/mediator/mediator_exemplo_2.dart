class Mediator {
  List<Seller> sellers = [];

  addSeller(Seller seller) {
    seller.setMediator(this);
    sellers.add(seller);
  }

  addSellers(List<Seller> sellers) {
    this.sellers.addAll(sellers);
  }

  bool buy(String id) {
    for (var seller in sellers) {
      if (seller.sellProduct(id)) {
        print('Compra realizada com sucesso!');
        return true;
      }
    }

    print('Não foi possível realizar a compra!');
    return false;
  }

  showProducts() {
    for (var seller in sellers) {
      seller.showPrducts();
    }
  }
}

class SellerProduct {
  String? id;
  String? name;
  double? price;

  SellerProduct({
    this.id,
    this.name,
    this.price,
  });

  isValid() {
    return id != null && name != null && price != null;
  }
}

class Seller {
  List<SellerProduct> products = [];
  Mediator? mediator;

  showPrducts() {
    for (var product in products) {
      print('${product.id} - ${product.name} - ${product.price}');
    }
  }

  addProduct(SellerProduct product) {
    products.add(product);
  }

  addProducts(List<SellerProduct> products) {
    products.addAll(products);
  }

  bool sellProduct(String id) {
    SellerProduct product =
        products.firstWhere((p) => p.id == id, orElse: () => SellerProduct());

    if (product.isValid()) {
      products.remove(product);
      return true;
    }

    return false;
  }

  setMediator(Mediator mediator) {
    this.mediator = mediator;
  }
}

class Buyer {
  Mediator mediator;

  Buyer({
    required this.mediator,
  });

  viewProducts() {
    mediator.showProducts();
  }

  buy(String id) {
    mediator.buy(id);
  }
}

void main(List<String> args) {
  Mediator mediator = Mediator();

  Seller seller1 = Seller();
  seller1.addProduct(SellerProduct(id: '1', name: 'Produto 1', price: 10.0));
  seller1.addProduct(SellerProduct(id: '2', name: 'Produto 2', price: 20.0));
  seller1.addProduct(SellerProduct(id: '3', name: 'Produto 3', price: 30.0));

  Seller seller2 = Seller();
  seller2.addProduct(SellerProduct(id: '4', name: 'Produto 4', price: 40.0));
  seller2.addProduct(SellerProduct(id: '5', name: 'Produto 5', price: 50.0));
  seller2.addProduct(SellerProduct(id: '6', name: 'Produto 6', price: 60.0));

  mediator.addSeller(seller1);
  mediator.addSeller(seller2);

  mediator.showProducts();

  print('\n');

  Buyer buyer = Buyer(mediator: mediator);
  buyer.buy('1');
  buyer.buy('2');

  print('\n');

  mediator.showProducts();
}
