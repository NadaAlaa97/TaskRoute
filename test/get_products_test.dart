import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:route/Data/model/repository/product_repository.dart';

void main() {
  test('testing the api and getting the products', ()async{
    final response = {
      "products": [
        {
          "id": 1,
          "title": "Essence Mascara Lash Princess",
          "description":
          "The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects. Achieve dramatic lashes with this long-lasting and cruelty-free formula.",
          "price": 9.99,
          "discountPercentage": 7.17,
          "rating": 4.94,
          "thumbnail":
          "https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/thumbnail.png"
        },
        {
          "id": 2,
          "title": "Eyeshadow Palette with Mirror",
          "description":
          "The Eyeshadow Palette with Mirror offers a versatile range of eyeshadow shades for creating stunning eye looks. With a built-in mirror, it's convenient for on-the-go makeup application.",
          "price": 19.99,
          "discountPercentage": 5.5,
          "rating": 3.28,
          "thumbnail":
          "https://cdn.dummyjson.com/products/images/beauty/Eyeshadow%20Palette%20with%20Mirror/thumbnail.png"
        }
      ]
    };
    final client = MockClient((request) async {
      return http.Response(jsonEncode(response), 200);
    }
    );

    final productRepository = ProductRepository(client);
    final products = await productRepository.fetchProducts();

    print('Products:');

    for (var product in products) {
      print('Title: ${product.title}, Price: ${product.price}, Rating: ${product.rating}, DiscountPercentage: ${product.discountPercentage}');
    }

    // the expected output to show.
    expect(products.length, 2);
    expect(products[0].title, 'Essence Mascara Lash Princess');
    expect(products[1].title, 'Eyeshadow Palette with Mirror');
    expect(products[1].rating, 3.28);
    expect(products[0].discountPercentage, 7.17);
  });
}