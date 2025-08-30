import 'dart:convert';

import 'package:daily_class_project/api/model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Api extends StatefulWidget {
  const Api({super.key});

  @override
  State<Api> createState() => _ApiState();
}

class _ApiState extends State<Api> {
  List<DataModel> productList = [];

  Future<void> getDat() async {
    Uri uri = Uri.parse('https://crud.teamrabbil.com/api/v1/ReadProduct');
    final reposne = await get(uri);
    // print(reposne.body);
    final jecoMap = jsonDecode(reposne.body);
    // print(jecoMap);
    final converList = jecoMap['data'] as List;
    // print(converList);

    print(productList.length);
    for (var item in converList) {
      productList.add(
        DataModel(
          id: "${item["_id"]}",
          ProductName: "${item["ProductName"]}",
          ProductCode: "${item["ProductCode"]}",
          Img: "${item["Img"]}",
          TotalPrice: "${item["TotalPrice"]}",
          CreatedDate: "${item["CreatedDate"]}",
        ),
      );
      setState(() {

      });
    }
    print(productList);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('API')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Data list ${productList.length}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(
                        'ProductName',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('ID : ${productList[index].id}'),
                          Text('ProductName : ${productList[index].ProductName}'),
                          Text('ProductCode : ${productList[index].ProductCode}'),
                          Text('Img : ${productList[index].Img}'),
                          Text('TotalPrice : \$${productList[index].TotalPrice}'),
                          Text('CreatedDate : ${productList[index].CreatedDate}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
