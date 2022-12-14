import 'package:flutter/cupertino.dart';
import 'package:flutter_course_shop_app/providers/products_provider.dart';
import 'package:flutter_course_shop_app/widgets/product_item.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';

class ProductsGrid extends StatelessWidget {
  final bool showOnlyFavorites;

  const ProductsGrid({
    Key? key,
    required this.showOnlyFavorites,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductsProvider>(context);
    final products =
        showOnlyFavorites ? productsData.favoriteItems : productsData.items;

    return GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) => ChangeNotifierProvider.value(
              // create: (context) => products[index],
              value: products[index],
              child: ProductItem(
                  // id: products[index].id,
                  // title: products[index].title,
                  // imageUrl: products[index].imageUrl,
                  ),
            ));
  }
}
