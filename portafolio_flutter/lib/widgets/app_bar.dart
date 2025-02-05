import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portafolio_flutter/const/laucher_url.dart';
import 'package:portafolio_flutter/const/theme.dart';
import 'package:portafolio_flutter/provider/app_bar_provider.dart';

class AppBarHome extends ConsumerWidget implements PreferredSizeWidget {
  const AppBarHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Widget> actionsMovil = [
      IconButton(
        onPressed: () {
          launchURL('https://www.linkedin.com/in/franco-galbiati', context);
        },
        icon: const FaIcon(FontAwesomeIcons.linkedin),
      ),
      const SizedBox(width: 10),
      IconButton(
        onPressed: () {
          launchURL('https://github.com/Galbfran/', context);
        },
        icon: const FaIcon(FontAwesomeIcons.github),
      ),
      const SizedBox(width: 10),
    ];
    final appBarScroll = ref.watch(appBarProvider);
    const List<Color> colors = [primaryColor, secundaryColor];

    return AppBar(
      title: Title(),
      flexibleSpace: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            stops: [appBarScroll.init, appBarScroll.end],
            colors: colors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
      actions: actionsMovil,
      leading: ExpandingLogo(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}

class ExpandingLogo extends StatefulWidget {
  const ExpandingLogo({super.key});

  @override
  ExpandingLogoState createState() => ExpandingLogoState();
}

class ExpandingLogoState extends State<ExpandingLogo> {
  bool isExpanded = false;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startAutoExpansion();
  }

  void _startAutoExpansion() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        isExpanded = !isExpanded;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => Scaffold.of(context).openDrawer(),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: TweenAnimationBuilder<double>(
          duration: Duration(milliseconds: 500),
          tween: Tween<double>(begin: 25, end: isExpanded ? 50 : 25),
          builder: (context, size, child) {
            return SvgPicture.asset(
              'assets/svg/logo_fran_svg.svg',
              width: size,
              height: size,
            );
          },
        ),
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 10),
        const Text(
          'Franco Galbiati',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
