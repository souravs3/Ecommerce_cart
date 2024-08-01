import 'package:ecommerce_app/view/utils/constant.dart';
import 'package:ecommerce_app/view/utils/width_and_hight.dart';
import 'package:flutter/material.dart';

class MySearchbar extends StatelessWidget {
  const MySearchbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
        color: contentColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.search,
            color: Colors.grey,
            size: 30,
          ),
          20.w,
          Flexible(
              flex: 4,
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Search...', border: InputBorder.none),
              )),
          Container(
            height: 25,
            width: 1.5,
            color: Colors.grey,
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.tune))
        ],
      ),
    );
  }
}
