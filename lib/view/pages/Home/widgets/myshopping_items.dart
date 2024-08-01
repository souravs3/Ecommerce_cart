import 'package:ecommerce_app/controllers/home_provider.dart';
import 'package:ecommerce_app/view/pages/Home/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyshoppingItems extends StatelessWidget {
  const MyshoppingItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, child) {
        // Flatten the list of lists into a single list of products
        final allProducts =
            homeProvider.selectedCategories.expand((x) => x).toList();

        return Container(
          height: MediaQuery.of(context).size.height * 0.8,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.70,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemCount: allProducts.length,
            shrinkWrap: true,
            physics: AlwaysScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ProductCard(product: allProducts[index]);
            },
          ),
        );
      },
    );
  }
}
