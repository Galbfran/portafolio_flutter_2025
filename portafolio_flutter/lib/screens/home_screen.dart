import 'package:flutter/material.dart';
import 'package:portafolio_flutter/widgets/app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarHome(),
      body: PageCarrousel(),
    );
  }
}

class PageCarrousel extends StatefulWidget {
  const PageCarrousel({
    super.key,
  });

  @override
  State<PageCarrousel> createState() => _PageCarrouselState();
}

class _PageCarrouselState extends State<PageCarrousel> {
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.of(context).size.height - 50;
    final List<Widget> pages = [
      GestureDetector(
        onTap: () => controller.animateToPage(1,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut),
        child: Container(
          width: width,
          height: height,
          color: Colors.amber,
        ),
      ),
      GestureDetector(
        onTap: () => controller.animateToPage(2,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut),
        child: Container(
          width: width,
          height: height,
          color: Colors.red,
        ),
      ),
      GestureDetector(
        onTap: () => controller.animateToPage(3,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut),
        child: Container(
          width: width,
          height: height,
          color: Colors.blue,
        ),
      ),
      GestureDetector(
        onTap: () => controller.animateToPage(4,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut),
        child: Container(
          width: width,
          height: height,
          color: Colors.green,
        ),
      ),
    ];
    return SizedBox(
      width: width,
      height: height,
      child: PageView.builder(
          scrollDirection: Axis.vertical,
          controller: controller,
          itemCount: pages.length,
          itemBuilder: (context, index) {
            return pages[index];
          }),
    );
  }
}
