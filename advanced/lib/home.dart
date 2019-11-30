import 'package:Shrine/supplemental/asymmetric_view.dart';
import 'package:flutter/material.dart';

import 'model/product.dart';
import 'model/products_repository.dart';

class HomePage extends StatelessWidget {
  // TODO: Make a collection of cards (102)
  // TODO: Add a variable for Category (104)
  @override
  Widget build(BuildContext context) {
    // TODO: Return an AsymmetricView (104)
    // TODO: Pass Category variable to AsymmetricView (104)
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        title: Text("SHRINE"),
        elevation: 8,
        leading: IconButton(
          onPressed: () {
            debugPrint('Menu button');
          },
          icon: Icon(
            Icons.menu,
            semanticLabel: "menu",
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              semanticLabel: 'search',
            ),
            onPressed: () {
              print('Search button');
            },
          ),
          IconButton(
            icon: Icon(
              Icons.tune,
              semanticLabel: 'filter',
            ),
            onPressed: () {
              print('Filter button');
            },
          ),
        ],
      ),
      body: AsymmetricView(
        products: ProductsRepository.loadProducts(Category.all),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
