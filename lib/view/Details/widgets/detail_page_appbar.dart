import 'package:ecommerce_app/controllers/favorite_provider.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/view/utils/width_and_hight.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailPageAppbar extends StatelessWidget {
  final Product product;
  const DetailPageAppbar({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Consumer<FavoriteProvider>(
          builder: (context, value, child) {
            return Row(
              children: [
                IconButton(
                    style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.white)),
                    padding: EdgeInsets.all(14),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      size: 20,
                    )),
                Spacer(),
                IconButton(
                    style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.white)),
                    padding: EdgeInsets.all(14),
                    onPressed: () {},
                    icon: Icon(
                      Icons.share_outlined,
                      size: 20,
                    )),
                10.w,
                IconButton(
                    style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.white)),
                    padding: EdgeInsets.all(14),
                    onPressed: () {
                      value.toggleFavorite(product);
                    },
                    icon: Icon(
                      value.isExist(product)
                          ? Icons.favorite
                          : Icons.favorite_outline,
                      size: 20,
                    )),
              ],
            );
          },
        ));
  }
}
