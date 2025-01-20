import 'package:flutter/material.dart';

class CarrouselImages extends StatelessWidget {
  final List<Widget> images;

  const CarrouselImages({
    super.key,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      allowImplicitScrolling: true,
      itemCount: images.length,
      itemBuilder: (context, index) => images[index],
    );
  }
}
