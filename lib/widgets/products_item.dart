import 'package:flutter/material.dart';
import 'package:myshop_app/screens/product_detail_screen.dart';
// import '../screens/product_detail_screen.dart';

class ProductsItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  const ProductsItem(
      {required this.id,
      required this.imageUrl,
      required this.title,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          title: Text(title, textAlign: TextAlign.center),
          backgroundColor: Colors.black87,
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite),
              color: Theme.of(context).colorScheme.secondary),
          trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart),
              color: Theme.of(context).colorScheme.secondary),
        ),
        child: GestureDetector(
          child: Image.network(imageUrl, fit: BoxFit.cover),
          onDoubleTap: () {
            Navigator.of(context)
                .pushNamed(ProductDetailScreen.routeName, arguments: id);
          },
        ),
      ),
    );
  }
}
