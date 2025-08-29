import 'dart:convert';

import 'package:daily_class_project/api_test/presentatrion/screen/wigets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../model/productModel.dart';
import 'add_new_product_screen.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    super.initState();
    getProduct();
  }

  List<Productmodel> productsList = [];

  void getProduct() async {
    Uri uri = Uri.parse('https://crud.teamrabbil.com/api/v1/ReadProduct');
    final reponse = await get(uri);
    print(reponse.statusCode);
    if (reponse.statusCode == 200) {
      print(reponse.runtimeType);
      Map<String, dynamic> jeconDecoe = jsonDecode(reponse.body);
      // print(jeconDecoe);
      final list = jeconDecoe['data'] as List;
      // print(list[0]);
      for (var item in list) {
        print(item['_id']);
        productsList.add(Productmodel(
            name: item['_id'],
            code: item['ProductName'],
            price: item['Img'],
            quantity: item['ProductCode'],
            totalPrice: item['Qty']));
        print(productsList.length);
      }
    } else {
      return;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Proudct List')),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView.separated(
          itemCount: productsList.length,
          itemBuilder: (context, index) {
            return Expanded(
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                tileColor: Colors.white,
                title: const Text('Product name'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Product Code: ${productsList[index].code}'),
                    Text('Price: \$ ${productsList[index].price}'),
                    Text('Quantity: ${productsList[index].quantity}'),
                    Text('Total Price: \$${productsList[index].totalPrice}'),
                    Divider(),
                    OverflowBar(
                      alignment: MainAxisAlignment.end,
                      children: [
                        TextButton.icon(
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) {
                            //     // return const UpdateProductScreen();
                            //   }),
                            // );
                          },
                          icon: const Icon(Icons.edit),
                          label: const Text('Edit'),
                        ),
                        TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.delete_outline,
                            color: Colors.red,
                          ),
                          label: const Text(
                            'Delete',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 16);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const AddNewProductScreen();
              },
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
