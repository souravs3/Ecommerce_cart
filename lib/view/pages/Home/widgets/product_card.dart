import 'package:ecommerce_app/controllers/favorite_provider.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/view/Details/details_page.dart';
import 'package:ecommerce_app/view/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsPage(product: product)));
      },
      child: Consumer<FavoriteProvider>(
        builder: (context, favoriteProvider, child) {
          return Stack(
            children: [
              Container(
                width: 400,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: contentColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: Hero(
                          tag: product.image,
                          child: Image.asset(
                            product.image,
                            width: 130,
                            height: 130,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        product.title,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Text(
                            '${product.price}',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  child: Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    favoriteProvider.toggleFavorite(product);
                  },
                  child: Container(
                    child: Icon(
                      favoriteProvider.isExist(product)
                          ? Icons.favorite
                          : Icons.favorite_outline,
                      color: Colors.white,
                      size: 22,
                    ),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(10))),
                  ),
                ),
              ))
            ],
          );
        },
      ),
    );
  }
}
