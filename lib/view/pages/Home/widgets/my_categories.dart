import 'package:ecommerce_app/controllers/home_provider.dart';
import 'package:ecommerce_app/models/category_models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCategories extends StatefulWidget {
  const MyCategories({super.key});

  @override
  State<MyCategories> createState() => _MyCategoriesState();
}

class _MyCategoriesState extends State<MyCategories> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, value, child) {
        return SizedBox(
          height: 130, // Adjusted height to fit content correctly
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categoriesList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Container(
                  width: 100, // Adjusted width
                  margin: EdgeInsets.only(right: 10), // Adjusted margin
                  padding:
                      EdgeInsets.symmetric(vertical: 10), // Adjusted padding
                  decoration: BoxDecoration(
                    color: selectedIndex == index
                        ? Colors.grey.shade300
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(
                        10), // Added border radius for rounded corners
                  ),
                  child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.start, // Center content vertically
                    children: [
                      Container(
                        width: 60, // Adjusted image width
                        height: 60, // Adjusted image height
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                              categoriesList[index].image,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 10), // Adjusted spacing
                      Text(
                        categoriesList[index].title,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold), // Adjusted font size
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
