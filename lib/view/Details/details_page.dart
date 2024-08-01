import 'package:ecommerce_app/controllers/detail_provider.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/view/Details/widgets/add_to_cart.dart';
import 'package:ecommerce_app/view/Details/widgets/description.dart';
import 'package:ecommerce_app/view/Details/widgets/detail_image_slider.dart';
import 'package:ecommerce_app/view/Details/widgets/detail_page_appbar.dart';
import 'package:ecommerce_app/view/Details/widgets/items_detail_page.dart';
import 'package:ecommerce_app/view/utils/constant.dart';
import 'package:ecommerce_app/view/utils/width_and_hight.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatefulWidget {
  final Product product;
  const DetailsPage({super.key, required this.product});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  // int currentSlide = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: contentColor,
      floatingActionButton: AddToCart(product: widget.product),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Consumer<DetailProvider>(
        builder: (context, detailProvider, child) {
          return Column(
            children: [
              50.h,
              DetailPageAppbar(
                product: widget.product,
              ),
              DetailImageSlider(
                  onChanged: (index) {
                    detailProvider.onChanged(index);
                  },
                  image: widget.product.image),
              20.h,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3, // Updated to 3 as there are 3 images
                  (index) => AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    width: detailProvider.currentImage == index ? 15 : 8,
                    height: 8,
                    margin: const EdgeInsets.only(right: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: detailProvider.currentImage == index
                          ? Colors.black
                          : Colors.transparent,
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              20.h,
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  ),
                  color: Colors.white,
                ),
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 100),

                //Datas
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ItemsDetailPage(product: widget.product),
                    15.h,
                    Text(
                      'Colors',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    20.h,
                    Row(
                      children: List.generate(
                        widget.product.colors.length,
                        (index) => GestureDetector(
                          onTap: () {
                            detailProvider.colorChanged(index);
                          },
                          child: AnimatedContainer(
                            width: 35,
                            height: 35,
                            padding: detailProvider.currentColor == index
                                ? EdgeInsets.all(2)
                                : null,
                            margin: EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: detailProvider.currentColor == index
                                    ? Colors.white
                                    : widget.product.colors[index],
                                border: detailProvider.currentColor == index
                                    ? Border.all(
                                        color: widget.product.colors[index])
                                    : null),
                            duration: Duration(milliseconds: 300),
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: widget.product.colors[index]),
                            ),
                          ),
                        ),
                      ),
                    ),
                    20.h,
                    Description(description: widget.product.description)
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
