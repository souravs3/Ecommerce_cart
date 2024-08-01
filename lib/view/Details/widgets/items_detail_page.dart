import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/view/utils/constant.dart';
import 'package:ecommerce_app/view/utils/width_and_hight.dart';
import 'package:flutter/material.dart';

class ItemsDetailPage extends StatelessWidget {
  const ItemsDetailPage({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.title,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        10.h,
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '\$${product.price}',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                15.w,
                10.h,
                Row(
                  children: [
                    Container(
                      width: 60,
                      height: 25,
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(20)),
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 14,
                            color: Colors.white,
                          ),
                          4.w,
                          Text(
                            product.rate.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    5.w,
                    Text(
                      product.review,
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ],
            ),
            Spacer(),
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: 'Seller : ',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  )),
              TextSpan(
                  text: '${product.seller}',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  )),
            ]))
          ],
        ),
      ],
    );
  }
}
