import 'package:ecommerce_app/controllers/bottom_nav_provider.dart';
import 'package:ecommerce_app/controllers/cart_provider.dart';
import 'package:ecommerce_app/controllers/detail_provider.dart';
import 'package:ecommerce_app/controllers/favorite_provider.dart';
import 'package:ecommerce_app/controllers/home_provider.dart';
import 'package:ecommerce_app/view/pages/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BottomNavProvider>(
            create: (context) => BottomNavProvider()),
        ChangeNotifierProvider<HomeProvider>(
            create: (context) => HomeProvider()),
        ChangeNotifierProvider<DetailProvider>(
            create: (context) => DetailProvider()),
        ChangeNotifierProvider<CartProvider>(
            create: (context) => CartProvider()),
        ChangeNotifierProvider<FavoriteProvider>(
            create: (context) => FavoriteProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          textTheme: GoogleFonts.mulishTextTheme(),
        ),
        debugShowCheckedModeBanner: false,
        home: BottomNavbar_Page(),
      ),
    );
  }
}
