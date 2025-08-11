import 'package:flutter/material.dart';

import '../productScreen/datamode/productModel.dart';

class ProductItem extends StatelessWidget {
   const ProductItem({super.key, required this.productmodel});
final Productmodel productmodel;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(5)),
      tileColor: Colors.black26.withOpacity(0.05),
      title: Text('Product Name : ${productmodel.prdouctName}'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Product Code: ${productmodel.productCode}'),
          Text('Price: ${productmodel.price}\$'),
          Text('Quantitiy: ${productmodel.qunatity}'),
          const Divider(),
          ButtonBar(
            children: [
              TextButton.icon(
                onPressed: () {},
                label: Text('Edit'),
                icon: Icon(Icons.edit),
              ),
              TextButton.icon(
                onPressed: () {},
                label: Text('Delete'),
                icon: Icon(Icons.delete),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
