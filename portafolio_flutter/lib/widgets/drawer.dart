import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:portafolio_flutter/const/laucher_url.dart';

class DrawerApp extends StatelessWidget {
  const DrawerApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> actionsMovil = [
      IconButton(
        onPressed: () {
          launchURL('https://www.linkedin.com/in/franco-galbiati', context);
          // kIsWeb
          //     ? launchURL(
          //         'https://www.linkedin.com/in/franco-galbiati/', context)
          //     : context.go(
          //         '/web_view?url=https://www.linkedin.com/in/franco-galbiati/&title=Linkedin');
        },
        icon: const FaIcon(FontAwesomeIcons.linkedin),
      ),
      const SizedBox(width: 10),
      IconButton(
        onPressed: () {
          kIsWeb
              ? launchURL('https://github.com/Galbfran/', context)
              : context.go(
                  '/web_view?url=https://github.com/Galbfran/&title=Github');
        },
        icon: const FaIcon(FontAwesomeIcons.github),
      ),
      const SizedBox(width: 10),
    ];
    return Drawer(
      child: Column(children: actionsMovil),
    );
  }
}
