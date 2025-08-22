import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AddPrdouctScreen extends StatefulWidget {
  AddPrdouctScreen({super.key});

  @override
  State<AddPrdouctScreen> createState() => _AddPrdouctScreenState();
}

class _AddPrdouctScreenState extends State<AddPrdouctScreen> {
  final TextEditingController producNameTEController = TextEditingController();
  final TextEditingController productCodeTEController = TextEditingController();
  final TextEditingController priceTEController = TextEditingController();
  final TextEditingController quantityTEController = TextEditingController();
  final GlobalKey<FormState> _globalKey  = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    producNameTEController.clear();
    productCodeTEController.clear();
    priceTEController.clear();
    quantityTEController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Product Item')),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _globalKey,
          child: Column(
            children: [
              TextField(
                controller: producNameTEController,
                decoration: _customInputDecoration(hintText: 'Product Name'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: productCodeTEController,
                decoration: _customInputDecoration(hintText: 'Product Code'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: priceTEController,
                decoration: _customInputDecoration(hintText: 'Price'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: quantityTEController,
                decoration: _customInputDecoration(hintText: 'Quantity'),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 45,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {},
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void onTabToValidation(){
    if(_globalKey.currentState!.validate()){
      
    }
  }
  Future<void> addItem( ) async{
    Uri uri = Uri.parse('');
  }

  InputDecoration _customInputDecoration({required String hintText}) {
    return InputDecoration(
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(30),
      ),
      hintText: hintText,
      filled: true,
      fillColor: Colors.black12,
    );
  }
}
