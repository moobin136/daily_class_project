import 'dart:convert';

import 'package:daily_class_project/dataModel.dart';
import 'package:daily_class_project/wigets/productlist.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rest API Testing'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Text(
            'Api Testeting',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: prdouctList.length,
              itemBuilder: (context, index) {
                return Productlist(prdouct: prdouctList[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  List<Prdouct> prdouctList = [];

  Future<void> getApiData() async {
    Uri uri = Uri.parse('https://crud.teamrabbil.com/api/v1/ReadProduct');
    Response response = await get(uri);
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      Map<String, dynamic> jesonResponse = jsonDecode(response.body);
      for (var item in jesonResponse['data']) {
        Prdouct addPrdouctData = Prdouct(
          id: item["_id"],
          productName: item["ProductName"],
          producdcode: item["ProductCode"],
          img: item["Img"],
          unitPrice: item["UnitPrice"],
          quantity: item["Qty"],
          totoalPrice: item["TotalPrice"],
          cratdata: item["CreatedDate"],
        );
        prdouctList.add(addPrdouctData);
      }
      setState(() {});
    } else {}
  }

  @override
  void initState() {
    getApiData();
    super.initState();
  }
}
