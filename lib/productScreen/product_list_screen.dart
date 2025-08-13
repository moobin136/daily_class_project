import 'dart:convert';

import 'package:daily_class_project/productScreen/productModel/productModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../widgets/product_itemData.dart';
import 'add_product_screen.dart';

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

          id: item['_id'] ?? '',
          prdouctName: item['ProductName'] ?? '',
          productCode: item["ProductCode"] ?? '',
          price: item["Img"] ?? '',
          qunatity: item['Qty'] ?? '',
        );
        inpress = false;
        setState(() {
          productList.add(productmodel);
        });
      }
    }
  }
}


//
// // To parse this JSON data, do
// //
// //     final prdouctState = prdouctStateFromJson(jsonString);
//
//
//
// PrdouctState prdouctStateFromJson(String str) => PrdouctState.fromJson(json.decode(str));
//
// String prdouctStateToJson(PrdouctState data) => json.encode(data.toJson());
//
// class PrdouctState {
//   String status;
//   List<Map<String, String>> data;
//
//   PrdouctState({
//     required this.status,
//     required this.data,
//   });
//
//   factory PrdouctState.fromJson(Map<String, dynamic> json) => PrdouctState(
//     status: json["status"],
//     data: List<Map<String, String>>.from(json["data"].map((x) => Map.from(x).map((k, v) => MapEntry<String, String>(k, v)))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "data": List<dynamic>.from(data.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
//   };
// }
