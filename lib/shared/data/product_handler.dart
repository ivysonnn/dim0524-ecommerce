import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:dim0524_ecommerce/shared/models/product.dart';

class ProductHandler {
  static const String _baseUrl = "https://fakestoreapi.com";

  Future<List<Product>> getProducts() async {

    try {
      final response = await http.get(Uri.parse('$_baseUrl/products'));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => Product.fromJson(json)).toList(); 
      } else {
        throw Exception('Error when getting the products: $response.statusCode');
      }
    } on SocketException {
      throw Exception("Sem conexão com a internet");
    }
  }

  Future<Product> getProductById(int id) async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/$id'));

      if (response.statusCode == 200) {
        return Product.fromJson(jsonDecode(response.body));

      } else {
        throw Exception('Error when getting the product: $response.statusCode');
      }
    } on SocketException {
      throw Exception("Sem conexão com a internet");
    }
  }
}