// lib/screens/product_form_screen.dart

import 'package:flutter/material.dart';

import '../core/utilst/network_cleaint.dart';
import 'model/data_model.dart';



class ProductFormScreen extends StatefulWidget {
  final Data? product; // null হলে add, না হলে edit
  const ProductFormScreen({super.key, this.product});

  @override
  State<ProductFormScreen> createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends State<ProductFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _productNameController;
  late TextEditingController _productCodeController;
  late TextEditingController _unitPriceController;
  late TextEditingController _qtyController;
  late TextEditingController _totalPriceController;

  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _isEditing = widget.product != null;
    _productNameController = TextEditingController(text: _isEditing ? widget.product!.productName : '');
    _productCodeController = TextEditingController(text: _isEditing ? widget.product!.productCode : '');
    _unitPriceController = TextEditingController(text: _isEditing ? widget.product!.unitPrice : '');
    _qtyController = TextEditingController(text: _isEditing ? widget.product!.qty : '');
    _totalPriceController = TextEditingController(text: _isEditing ? widget.product!.totalPrice : '');
  }

  @override
  void dispose() {
    _productNameController.dispose();
    _productCodeController.dispose();
    _unitPriceController.dispose();
    _qtyController.dispose();
    _totalPriceController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final productData = Data(
        productName: _productNameController.text,
        productCode: _productCodeController.text,
        unitPrice: _unitPriceController.text,
        qty: _qtyController.text,
        totalPrice: _totalPriceController.text,
      );

      try {
        if (_isEditing) {
          await updateProduct(widget.product!.sId!, productData);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Product updated successfully!')),
          );
        } else {
          await createProduct(productData);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Product created successfully!')),
          );
        }
        Navigator.pop(context, true); // Go back and indicate success
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditing ? 'Edit Product' : 'Add Product'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _productNameController,
                decoration: const InputDecoration(labelText: 'Product Name'),
                validator: (value) => value!.isEmpty ? 'Please enter a name' : null,
              ),
              TextFormField(
                controller: _productCodeController,
                decoration: const InputDecoration(labelText: 'Product Code'),
                validator: (value) => value!.isEmpty ? 'Please enter a code' : null,
              ),
              TextFormField(
                controller: _unitPriceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Unit Price'),
                validator: (value) => value!.isEmpty ? 'Please enter a unit price' : null,
              ),
              TextFormField(
                controller: _qtyController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Quantity'),
                validator: (value) => value!.isEmpty ? 'Please enter quantity' : null,
              ),
              TextFormField(
                controller: _totalPriceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Total Price'),
                validator: (value) => value!.isEmpty ? 'Please enter total price' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text(_isEditing ? 'Update Product' : 'Add Product'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}