import 'package:flutter/material.dart';

class CarrouselImages extends StatelessWidget {
  final List<Widget> images;

  const CarrouselImages({
    super.key,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController(initialPage: 0);
    return Stack(
      children: [
        PageView.builder(
          controller: pageController,
          allowImplicitScrolling: true,
          itemCount: images.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(20.0),
            child: images[index],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                pageController.previousPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
              icon: Center(child: const Icon(Icons.arrow_back_ios)),
            ),
            IconButton(
              onPressed: () {
                pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
              icon: Center(child: const Icon(Icons.arrow_forward_ios)),
            )
          ],
        )
      ],
    );
  }
}
