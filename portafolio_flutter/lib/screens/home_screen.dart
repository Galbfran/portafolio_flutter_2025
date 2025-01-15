import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portafolio_flutter/provider/app_bar_provider.dart';
import 'package:portafolio_flutter/screens/pages/page_about.dart';
import 'package:portafolio_flutter/screens/pages/page_finniu.dart';
import 'package:portafolio_flutter/screens/pages/page_init.dart';
import 'package:portafolio_flutter/screens/pages/page_silver.dart';
import 'package:portafolio_flutter/widgets/app_bar.dart';
import 'package:portafolio_flutter/widgets/drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerApp(),
      appBar: AppBarHome(),
      body: PageCarrousel(),
    );
  }
}

class PageCarrousel extends HookConsumerWidget {
  const PageCarrousel({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PageController controller = PageController(initialPage: 0);
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.of(context).size.height - 50;

    controller.addListener(() {
      if (controller.page == 0) {
        ref.read(appBarProvider.notifier).state = AppBarScroll(0, 0.4);
      }
      if (controller.page == 1) {
        ref.read(appBarProvider.notifier).state = AppBarScroll(0.2, 0.4);
      }
      if (controller.page == 2) {
        ref.read(appBarProvider.notifier).state = AppBarScroll(0.4, 0.6);
      }
      if (controller.page == 3) {
        ref.read(appBarProvider.notifier).state = AppBarScroll(0.6, 0.8);
      }
    });

    const List<Widget> pages = [
      PageInit(),
      PageAbout(),
      PageFinniu(),
      PageSilver(),
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
