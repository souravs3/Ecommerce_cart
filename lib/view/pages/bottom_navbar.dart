import 'package:ecommerce_app/controllers/bottom_nav_provider.dart';
import 'package:ecommerce_app/view/pages/Cart/cart_page.dart';
import 'package:ecommerce_app/view/pages/Profile/profile_page.dart';
import 'package:ecommerce_app/view/pages/Favorite/favorite_page.dart';
import 'package:ecommerce_app/view/pages/Home/home_page.dart';
import 'package:ecommerce_app/view/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavbar_Page extends StatelessWidget {
  const BottomNavbar_Page({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      HomePage(),
      FavoritePage(),
      HomePage(),
      CartPage(),
      Profile(),
    ];

    return Consumer<BottomNavProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              provider.setIndex(2);
            },
            shape: CircleBorder(),
            backgroundColor: primaryColor,
            child: Icon(
              Icons.home,
              size: 35,
              color: Colors.white,
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            elevation: 1,
            height: 80,
            color: Colors.white,
            shape: CircularNotchedRectangle(),
            notchMargin: 10,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    provider.setIndex(0);
                  },
                  icon: Icon(
                    Icons.grid_view_outlined,
                    size: 30,
                    color: provider.currentIndex == 0
                        ? primaryColor
                        : Colors.grey.shade400,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    provider.setIndex(1);
                  },
                  icon: Icon(
                    Icons.favorite_border,
                    size: 30,
                    color: provider.currentIndex == 1
                        ? primaryColor
                        : Colors.grey.shade400,
                  ),
                ),
                SizedBox(width: 15),
                IconButton(
                  onPressed: () {
                    provider.setIndex(3);
                  },
                  icon: Icon(
                    Icons.shopping_bag,
                    size: 30,
                    color: provider.currentIndex == 3
                        ? primaryColor
                        : Colors.grey.shade400,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    provider.setIndex(4);
                  },
                  icon: Icon(
                    Icons.person,
                    size: 30,
                    color: provider.currentIndex == 4
                        ? primaryColor
                        : Colors.grey.shade400,
                  ),
                ),
              ],
            ),
          ),
          body: screens[provider.currentIndex],
        );
      },
    );
  }
}
