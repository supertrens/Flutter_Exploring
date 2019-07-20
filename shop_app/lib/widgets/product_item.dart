import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductItem extends StatelessWidget {
  final Product currentProduct;

  ProductItem(this.currentProduct);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.network(
        currentProduct.imageUrl,
        fit: BoxFit.cover,
      ),
      footer: GridTileBar(
        backgroundColor: Colors.black54,
        leading: IconButton(
          icon: Icon(Icons.favorite),
          onPressed: (){},
        ),
        title: Text(
          currentProduct.title,
          textAlign: TextAlign.center,
        ),
        trailing: IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: (){},
        ),
      ),
    );
  }
}
