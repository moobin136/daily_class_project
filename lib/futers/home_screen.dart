// lib/screens/home_screen.dart

import 'package:flutter/material.dart';

import '../core/utilst/network_cleaint.dart';
import 'add_product.dart';
import 'model/data_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<ProductModel> futureProducts;

  @override
  void initState() {
    super.initState();
    futureProducts = fetchProducts();
  }

  void _onDelete(Data product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Deletion'),
        content:
            Text('Are you sure you want to delete ${product.productName}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context), // No
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context); // Close the dialog
              try {
                await deleteProduct(product.sId!);
                _refreshData(); // Refresh the list
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Product deleted successfully!')),
                );
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Failed to delete: $e')),
                );
              }
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _refreshData() {
    setState(() {
      futureProducts = fetchProducts();
    });
  }

  void _onEdit(Data product) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ProductFormScreen(product: product)),
    );
    if (result == true) {
      _refreshData();
    }
  }

  void _onAdd() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProductFormScreen()),
    );
    if (result == true) {
      _refreshData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title:
            const Text('Product List', style: TextStyle(color: Colors.white)),
      ),
      body: FutureBuilder<ProductModel>(
        future: futureProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData && snapshot.data!.data!.isNotEmpty) {
            final products = snapshot.data!.data!;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Card(
                      color: Colors.white.withOpacity(0.7),
                      child: ListTile(
                        title: Text(
                          product.productName ?? 'No Name',
                          style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Product Code: ${product.productCode ?? 'N/A'}\n'
                              'UnitPrice: \$${product.unitPrice ?? 'N/A'}\n'
                              'Qty: ${product.qty ?? 'N/A'}\n'
                              'TotalPrice: \$${product.totalPrice ?? 'N/A'}\n'
                              'CreatedDate: ${product.createdDate ?? 'N/A'}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 15),
                            ),
                            const SizedBox(height: 10),
                            Divider(
                                color: Colors.black.withOpacity(0.5),
                                thickness: 1),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                ElevatedButton.icon(
                                  label: const Text(
                                    'Edit',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.black,
                                  ),
                                  onPressed: () => _onEdit(product),
                                ),
                                const SizedBox(width: 10),
                                ElevatedButton.icon(
                                  label: const Text(
                                    'Delete',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                  icon: const Icon(
                                    Icons.delete_outline,
                                    color: Colors.red,
                                  ),
                                  onPressed: () => _onDelete(product),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return const Center(
              child: Text('No products found. Add a new one!'),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onAdd,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}
