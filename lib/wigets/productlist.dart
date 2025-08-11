import 'package:daily_class_project/dataModel.dart';
import 'package:flutter/material.dart';

class Productlist extends StatelessWidget {
  Productlist({super.key, required this.prdouct});
  final Prdouct prdouct;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(prdouct.id),
      subtitle: Column(
        children: [
          Text("Product Name ${prdouct.productName}"),
          Text('Pdrouct Item'),
          Text('Product Quantity: ${prdouct.quantity}'),
          Text('UnitPrice: 55'),
          Text('Totoal Price : ${prdouct.totoalPrice}'),
        ],
      ),
    );
  }
}
