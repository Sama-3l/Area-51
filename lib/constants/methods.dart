import 'package:area_51/data/models/product.dart';

class Methods {
  Map<String, dynamic> encode(Product product) {
    return {
      'name': product.name,
      'description': product.description,
      'price': product.price,
      'id': product.productId
    };
  }

  List<Map> cartEntry(List<Map> cartProducts) {
    List<Map> list = [];
    for (int i = 0; i < cartProducts.length; i++) {
      list.add({
        'name': encode(cartProducts[i]['name']),
        'count': cartProducts[i]['count']
      });
    }
    return list;
  }

  Map<dynamic, dynamic> initializeObject(Map product) {
    return {
      'name': Product(
          price: product['name']['price'],
          description: product['name']['description'],
          name: product['name']['name'],
          productId: product['name']['id']),
      'count': product['count'],
    };
  }
}
