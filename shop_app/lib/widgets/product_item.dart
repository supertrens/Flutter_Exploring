import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './../screens/product_detail.dart';
import './../providers/product.dart';
import './../providers/cart.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final currentProduct = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context, listen: false);

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
          footer: buildGridTileBar(currentProduct, context, cart),
        ),
      ),
    );
  }

  GridTileBar buildGridTileBar(
      Product currentProduct, BuildContext context, Cart cart) {
    return GridTileBar(
      backgroundColor: Colors.black87,
      leading: IconButton(
        icon: Icon(
            currentProduct.isFavorite ? Icons.favorite : Icons.favorite_border),
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
        onPressed: () {
          cart.addItem(
              currentProduct.id, currentProduct.price, currentProduct.title);
          Scaffold.of(context).hideCurrentSnackBar();
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text(
              'Added Item to cart',
            ),
            duration: Duration(seconds: 2),
            action: SnackBarAction(
              label: 'UNDO',
              onPressed: () {
                cart.removeSingleItem(currentProduct.id);
              },
            ),
          ));
        },
      ),
    );
  }
}
