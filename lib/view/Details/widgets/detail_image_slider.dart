import 'package:flutter/material.dart';

class DetailImageSlider extends StatelessWidget {
  const DetailImageSlider(
      {super.key, required this.onChanged, required this.image});
  final Function(int) onChanged;
  final String image;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: PageView.builder(
          onPageChanged: onChanged,
          itemBuilder: (context, index) {
            return Hero(tag: image, child: Image.asset(image));
          }),
    );
  }
}
