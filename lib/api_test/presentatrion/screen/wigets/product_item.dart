import 'package:flutter/material.dart';


class ProductItem extends StatelessWidget {
   ProductItem({
    super.key,

  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      tileColor: Colors.white,
      title: const Text('Product name'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Product Code: CODE123}'),
          const Text('Price: \$120'),
          const Text('Quantity: 2'),
          const Text('Total Price: \$240'),
          const Divider(),
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
    );
  }
}