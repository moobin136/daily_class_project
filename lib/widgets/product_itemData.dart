import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../productScreen/productModel/productModel.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({super.key, required this.productmodel});

  final Productmodel productmodel;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(5)),
      tileColor: Colors.black26.withOpacity(0.05),
      title: Text('Product Name : ${widget.productmodel.prdouctName}'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Product Code: ${widget.productmodel.productCode}'),
          Text('Price: ${widget.productmodel.price}\$'),
          Text('Quantitiy: ${widget.productmodel.qunatity}'),
          const Divider(),
          ButtonBar(
            children: [
              TextButton.icon(
                onPressed: () {},
                label: Text('Edit'),
                icon: Icon(Icons.edit),
              ),
              TextButton.icon(
                onPressed: () {
                  delete('${widget.productmodel.id}');
                  setState(() {

                  });
                },
                label: Text('Delete'),
                icon: Icon(Icons.delete),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> delete(String id) async {
    Uri uri = Uri.parse('https://crud.teamrabbil.com/api/v1/DeleteProduct/$id');
    Response response = await get(uri);

    print(response.statusCode);
    print(response.body);
  }
}
