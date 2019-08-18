import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './../screens/product_detail.dart';
import './../providers/product.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final currentProduct = Provider.of<Product>(context);
    return Consumer<Product>(
      builder: (ctx, currentProduct, _) => ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
                  arguments: currentProduct.id);
            },
            child: Image.network(
              currentProduct.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          footer: buildGridTileBar(currentProduct, context),
        ),
      ),
    );
  }

  GridTileBar buildGridTileBar(Product currentProduct, BuildContext context) {
    return GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
            icon: Icon(currentProduct.isFavorite
                ? Icons.favorite
                : Icons.favorite_border),
            color: Theme.of(context).accentColor,
            onPressed: () {
              currentProduct.toggleFavoriteStatus();
            },
          ),
          title: Text(
            currentProduct.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            color: Theme.of(context).accentColor,
            onPressed: () {},
          ),
        );
  }
}
