import 'package:ecommerce_app/view/utils/constant.dart';
import 'package:flutter/material.dart';

class Coustum_Appbar extends StatelessWidget {
  const Coustum_Appbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(contentColor)),
            padding: EdgeInsets.all(18),
            onPressed: () {},
            icon: Image.asset(
              'images/icon.png',
              height: 18,
            )),
        IconButton(
            style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(contentColor)),
            padding: EdgeInsets.all(18),
            onPressed: () {},
            icon: Icon(
              Icons.notifications_outlined,
              size: 20,
            )),
      ],
    );
  }
}
