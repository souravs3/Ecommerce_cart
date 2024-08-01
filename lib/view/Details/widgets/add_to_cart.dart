import 'package:ecommerce_app/controllers/cart_provider.dart';
import 'package:ecommerce_app/controllers/detail_provider.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/view/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
          height: 85,
          margin: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.black,
          ),
          padding: EdgeInsets.symmetric(horizontal: 15),
          alignment: Alignment.center,
          child: Consumer<DetailProvider>(
            builder: (context, detailprovider, child) {
              return Consumer<CartProvider>(
                builder: (context, cartprovider, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white, width: 2)),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                if (detailprovider.currentIndex > 1) {
                                  detailprovider.currentIndex--;
                                }
                              },
                              icon: Icon(
                                Icons.remove,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                            SizedBox(width: 5), // Replace 5.w with SizedBox
                            Text(
                              detailprovider.currentIndex.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 5), // Replace 5.w with SizedBox
                            IconButton(
                              onPressed: () {
                                detailprovider.currentIndex++;
                              },
                              icon: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          cartprovider.toggleFavorite(product);
                          const snackbar = SnackBar(
                            content: Text(
                              'Added Successfully',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w300),
                            ),
                            duration: Duration(seconds: 1),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        },
                        child: Container(
                          height: 55,
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Text(
                            'Add To Cart',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          )),
    );
  }
}
