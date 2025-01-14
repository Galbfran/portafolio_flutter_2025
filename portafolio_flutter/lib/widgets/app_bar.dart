import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portafolio_flutter/const/theme.dart';
import 'package:portafolio_flutter/provider/app_bar_provider.dart';

List<Widget> actions = [
  IconButton(
    onPressed: () {},
    icon: const FaIcon(FontAwesomeIcons.envelope),
  ),
  const SizedBox(width: 10),
  IconButton(
    onPressed: () {},
    icon: const FaIcon(FontAwesomeIcons.linkedin),
  ),
  const SizedBox(width: 10),
  IconButton(
    onPressed: () {},
    icon: const FaIcon(FontAwesomeIcons.github),
  ),
  const SizedBox(width: 10),
];

class AppBarHome extends ConsumerWidget implements PreferredSizeWidget {
  const AppBarHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}

class Title extends StatelessWidget {
  const Title({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/svg/logo_fran_svg.svg',
          width: 30,
          height: 30,
        ),
        SizedBox(width: 10),
        const Text(
          'Franco Galbiati',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
