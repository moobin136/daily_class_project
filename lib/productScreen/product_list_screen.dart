import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../widgest/product_item.dart';
import 'add_product_screen.dart';
import 'datamode/productModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool inpress = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PdrouctList'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                getProductInfo();
              });
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: inpress
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ListView.separated(
                      itemCount: productList.length,
                      itemBuilder: (context, index) {
                        return ProductItem(productmodel: productList[index]);
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 10);
                      },
                    ),
                  ),
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddPrdouctScreen()),
          );
        },
      ),
    );
  }

  List<Productmodel> productList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProductInfo();
  }

  Future<void> getProductInfo() async {
    inpress = true;

    Uri uri = Uri.parse('https://crud.teamrabbil.com/api/v1/ReadProduct');
    Response response = await get(uri);
    if (response.statusCode == 200) {
      productList.clear();
      print(response.body);
      print(response.statusCode);
      Map<String, dynamic> jesonDecode = jsonDecode(response.body);
      for (var item in jesonDecode["data"]) {
        Productmodel productmodel = Productmodel(
          prdouctName: item['ProductName'],
          productCode: item["ProductCode"],
          price: item["Img"],
          qunatity: item['Qty'],
        );
        inpress = false;
        setState(() {
          productList.add(productmodel);
        });
      }
    }
  }
}
