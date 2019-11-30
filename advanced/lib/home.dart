import 'package:Shrine/supplemental/asymmetric_view.dart';
import 'package:flutter/material.dart';

import 'model/product.dart';
import 'model/products_repository.dart';

class HomePage extends StatelessWidget {
  // TODO: Make a collection of cards (102)
  // TODO: Add a variable for Category (104)
  @override
  Widget build(BuildContext context) {
    return AsymmetricView(
        products: ProductsRepository.loadProducts(Category.all));
    // TODO: Pass Category variable to AsymmetricView (104)
  }
}
