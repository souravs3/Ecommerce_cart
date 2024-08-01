import 'package:ecommerce_app/controllers/cart_provider.dart';
import 'package:ecommerce_app/view/pages/Cart/widget/checkout.dart';
import 'package:ecommerce_app/view/utils/constant.dart';
import 'package:ecommerce_app/view/utils/width_and_hight.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: contentColor,
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          return Column(
            children: [
              20.h,
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    // IconButton(
                    //     style: ButtonStyle(
                    //         backgroundColor:
                    //             WidgetStatePropertyAll(Colors.white)),
                    //     padding: EdgeInsets.all(14),
                    //     onPressed: () {
                    //       Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //               builder: (context) => HomePage()));
                    //     },
                    //     icon: Icon(
                    //       Icons.arrow_back_ios_new,
                    //       size: 20,
                    //     )),
                    120.w,
                    Text(
                      'My Cart',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: cartProvider.carts.length,
                      itemBuilder: (context, index) {
                        final cartItems = cartProvider.carts[index];
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
                                      height: 120,
                                      width: 110,
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
                                          cartProvider.removeFromCart(index);
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                          color: primaryColor,
                                        )),
                                    10.h,
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      height: 45,
                                      decoration: BoxDecoration(
                                          color: contentColor,
                                          border: Border.all(
                                            color: Colors.grey.shade200,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Row(
                                        children: [
                                          5.w,
                                          cartProvider.productQuantity(
                                              index, Icons.add),
                                          10.w,
                                          Text(
                                            cartItems.quantity.toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          10.w,
                                          cartProvider.productQuantity(
                                              index, Icons.remove),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        );
                      }))
            ],
          );
        },
      ),
      bottomSheet: Checkout(),
    );
  }
}
