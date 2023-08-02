import 'package:aumettask_1/module/product.dart';
import 'package:flutter/material.dart';

class DetailesPage extends StatelessWidget {

  Products products;
  DetailesPage(this.products  ) ;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          Image.network(products.photoUrl!),
          ListTile(
            title: Text(products.description!),
          ),
          ListTile(
            subtitle: Text("Distributor Name"),
            title: Text(products.category!),
          ),
          ListTile(
            subtitle: Text("Scientific Name"),
            title: Text(products.description!),
            leading: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            subtitle: Text("Retal Price"),
            title: Text("$products.price!"),
          ),
          ListTile(
            subtitle: Text("Made in"),
            title: Text(products.updatedAt!),
          )

        ],
      ),
    );
  }
}
