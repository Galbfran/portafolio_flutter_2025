import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portafolio_flutter/const/clipboard_copy.dart';
import 'package:portafolio_flutter/const/laucher_url.dart';
import 'package:portafolio_flutter/const/theme.dart';
import 'package:portafolio_flutter/provider/app_bar_provider.dart';

class DrawerApp extends ConsumerWidget {
  const DrawerApp({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appBarScroll = ref.watch(appBarProvider);
    const List<Color> colors = [primaryColor, secundaryColor];
    return Drawer(
      backgroundColor: Colors.transparent,
      child: AnimatedContainer(
        width: MediaQuery.sizeOf(context).width * 0.8,
        duration: const Duration(milliseconds: 400),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            stops: [appBarScroll.init, appBarScroll.end],
            colors: colors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25,
            ),
            Center(
              child: SvgPicture.asset(
                'assets/svg/logo_fran_svg.svg',
                width: 150,
                height: 150,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Franco Galbiati',
                style: TextStyle(fontSize: 25),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Desarrollador Full Stack',
                style: TextStyle(fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Text(
                    '11-6227-1014',
                    style: TextStyle(fontSize: 15),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    onPressed: () =>
                        clipBoardCopy(text: '11-6227-1014', context: context),
                    icon: const Icon(
                      Icons.copy,
                      size: 15,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Text(
                    'francogalbiati984@gmail.com',
                    style: TextStyle(fontSize: 15),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    onPressed: () => clipBoardCopy(
                        text: 'francogalbiati984@gmail.com', context: context),
                    icon: const Icon(
                      Icons.copy,
                      size: 15,
                    ),
                  )
                ],
              ),
            ),
            Divider(
              color: buttonColor,
              height: 2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 5,
                    backgroundColor: buttonColor,
                    shadowColor: primaryColor),
                onPressed: () {
                  launchURL(
                      'https://www.linkedin.com/in/franco-galbiati', context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const FaIcon(
                      FontAwesomeIcons.linkedin,
                      color: Color(0xff000000),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Linkedin',
                      style: TextStyle(fontSize: 15, color: Color(0xff000000)),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 5,
                    backgroundColor: buttonColor,
                    shadowColor: primaryColor),
                onPressed: () {
                  launchURL('https://github.com/Galbfran/', context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const FaIcon(
                      FontAwesomeIcons.github,
                      color: Color(0xff000000),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Linkedin',
                      style: TextStyle(fontSize: 15, color: Color(0xff000000)),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
