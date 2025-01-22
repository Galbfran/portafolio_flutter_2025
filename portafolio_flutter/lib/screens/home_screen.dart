import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portafolio_flutter/const/theme.dart';
import 'package:portafolio_flutter/provider/app_bar_provider.dart';
import 'package:portafolio_flutter/provider/loader_provider.dart';
import 'package:portafolio_flutter/screens/pages/page_about.dart';
import 'package:portafolio_flutter/screens/pages/page_contact.dart';
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

class PageCarrousel extends ConsumerWidget {
  const PageCarrousel({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loader = ref.watch(loaderProvider);
    final ScrollController scrollController = ScrollController(
      initialScrollOffset: 0.0,
    );

    final height = MediaQuery.of(context).size.height - 50;

    scrollController.addListener(() {
      if (scrollController.offset == 0) {
        ref.read(appBarProvider.notifier).state = AppBarScroll(0, 0.4);
      }
      if (scrollController.offset > 0) {
        ref.read(appBarProvider.notifier).state = AppBarScroll(0.2, 0.4);
      }
      if (scrollController.offset > height) {
        ref.read(appBarProvider.notifier).state = AppBarScroll(0.4, 0.6);
      }
      if (scrollController.offset > height * 2) {
        ref.read(appBarProvider.notifier).state = AppBarScroll(0.6, 0.8);
      }
    });

    const List<Widget> pages = [
      PageInit(),
      PageAbout(),
      PageFinniu(),
      PageSilver(),
      if (kIsWeb) PageContact(),
    ];

    return Stack(
      children: [
        SingleChildScrollView(
          controller: scrollController,
          child: Column(children: pages),
        ),
        if (loader)
          Container(
            width: MediaQuery.sizeOf(context).width,
            height: height,
            color: secundaryColor.withAlpha(100),
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: CircularProgressIndicator(),
                  ),
                  SvgPicture.asset(
                    'assets/svg/logo_fran_svg.svg',
                    width: 100,
                    height: 100,
                  )
                ],
              ),
            ),
          ),
      ],
    );
  }
}
