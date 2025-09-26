// lib/services/api_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../futers/model/data_model.dart';


Future<ProductModel> fetchProducts() async {
  // ... (existing code for fetching products)
  const url = 'https://crud.teamrabbil.com/api/v1/ReadProduct';
  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
 
      return ProductModel.fromJson(jsonResponse);

    } else {
      throw Exception('Failed to load products. Status Code: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Failed to connect to the server: $e');
  }
}

Future<void> createProduct(Data productData) async {
  // ... (existing code for creating product)
  const url = 'https://crud.teamrabbil.com/api/v1/CreateProduct';
  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(productData.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to create product. Status Code: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Failed to connect to the server or create product: $e');
  }
}

Future<void> updateProduct(String productId, Data productData) async {
  // ... (existing code for updating product)
  final url = 'https://crud.teamrabbil.com/api/v1/UpdateProduct/$productId';
  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(productData.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update product. Status Code: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Failed to connect to the server or update product: $e');
  }
}

// ✅ নতুন ডিলিট ফাংশন
Future<void> deleteProduct(String productId) async {
  final url = 'https://crud.teamrabbil.com/api/v1/DeleteProduct/$productId';
  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete product. Status Code: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Failed to connect to the server or delete product: $e');
  }
}