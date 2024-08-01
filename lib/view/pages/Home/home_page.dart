import 'package:ecommerce_app/controllers/home_provider.dart';
import 'package:ecommerce_app/models/category_models.dart';
import 'package:ecommerce_app/view/pages/Home/widgets/cstum_appbar.dart';
import 'package:ecommerce_app/view/pages/Home/widgets/image_slider.dart';
import 'package:ecommerce_app/view/pages/Home/widgets/my_searchbar.dart';
import 'package:ecommerce_app/view/pages/Home/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50), // Use const for optimization
              const Coustum_Appbar(),
              const SizedBox(height: 15),
              const MySearchbar(),
              const SizedBox(height: 25),
              Consumer<HomeProvider>(
                builder: (context, sliderProvider, child) {
                  return ImageSlider(
                    onChange: sliderProvider.changeSlider,
                    currentSlide: sliderProvider.currentSlider,
                  );
                },
              ),
              const SizedBox(height: 30),
              Consumer<HomeProvider>(
                builder: (context, homeProvider, child) {
                  return SizedBox(
                    height: 130, // Adjusted height to fit content correctly
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categoriesList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            homeProvider.changeTab(index);
                          },
                          child: Container(
                            width: 100, // Adjusted width
                            margin:
                                const EdgeInsets.only(right: 10), // Adjusted margin
                            padding: const EdgeInsets.symmetric(
                                vertical: 10), // Adjusted padding
                            decoration: BoxDecoration(
                              color: homeProvider.selectedIndex == index
                                  ? Colors.grey.shade300
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(
                                  10), // Added border radius for rounded corners
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment
                                  .start, // Center content vertically
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
                                const SizedBox(height: 10), // Adjusted spacing
                                Text(
                                  categoriesList[index].title,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight:
                                          FontWeight.bold), // Adjusted font size
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Special for you',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'See All',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black38),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Consumer<HomeProvider>(
                builder: (context, homeProvider, child) {
                  return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.60,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    itemCount: homeProvider.selectedCategories[homeProvider.selectedIndex].length,
                    shrinkWrap: true,
                    physics:
                        const NeverScrollableScrollPhysics(), // Prevent GridView from scrolling
                    itemBuilder: (context, index) {
                      return ProductCard(
                          product: homeProvider.selectedCategories[homeProvider.selectedIndex][index]);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
