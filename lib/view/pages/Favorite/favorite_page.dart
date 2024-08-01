import 'package:ecommerce_app/controllers/favorite_provider.dart';
import 'package:ecommerce_app/view/utils/constant.dart';
import 'package:ecommerce_app/view/utils/width_and_hight.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Favorite',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Consumer<FavoriteProvider>(
              builder: (context, favoriteProvider, child) {
                return Expanded(
                    child: ListView.builder(
                        itemCount: favoriteProvider.favorites.length,
                        itemBuilder: (context, index) {
                          final cartItems = favoriteProvider.favorites[index];
                          return Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 10),
                                        height: 70,
                                        width: 80,
                                        decoration: BoxDecoration(
                                            color: contentColor,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Image.asset(cartItems.image),
                                      ),
                                      20.w,
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            cartItems.title,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          5.h,
                                          Text(
                                            cartItems.category,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey),
                                          ),
                                          10.h,
                                          Text(
                                            '\$${cartItems.price.toString()}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                  top: 50,
                                  right: 35,
                                  child: Column(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            favoriteProvider
                                                .removeFavoriteItem(index);
                                            // cartProvider.removeFromCart(index);
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            color: primaryColor,
                                          )),
                                      10.h,
                                      // Container(
                                      //   padding: EdgeInsets.symmetric(
                                      //       horizontal: 10),
                                      //   height: 45,
                                      //   decoration: BoxDecoration(
                                      //       color: contentColor,
                                      //       border: Border.all(
                                      //         color: Colors.grey.shade200,
                                      //         width: 2,
                                      //       ),
                                      //       borderRadius:
                                      //           BorderRadius.circular(20)),
                                      //   child: Row(
                                      //     children: [
                                      //       5.w,
                                      //       cartProvider.productQuantity(
                                      //           index, Icons.add),
                                      //       10.w,
                                      //       Text(
                                      //         cartItems.quantity.toString(),
                                      //         style: TextStyle(
                                      //             fontWeight: FontWeight.bold),
                                      //       ),
                                      //       10.w,
                                      //       cartProvider.productQuantity(
                                      //           index, Icons.remove),
                                      //     ],
                                      //   ),
                                      // ),
                                    ],
                                  )),
                            ],
                          );
                        }));
              },
            )
          ],
        ));
  }
}
