import 'dart:convert';
import 'package:http/http.dart' as http;

import '../response/productResponseDto.dart';

class ProductRepository{
  final http.Client client;
  ProductRepository(this.client);
  Future<List<ProductModel>> fetchProducts() async{
    final response = await client.get(Uri.parse('https://dummyjson.com/products'));
    if(response.statusCode == 200) {
      final List<dynamic> productsJson = jsonDecode(response.body)['products'];
      return productsJson.map((json) => ProductModel.fromJson(json)).toList();
    } else{
      throw Exception('Failed to load products');
    }
  }
}
