import 'package:flutter/material.dart';
import 'package:portafolio_flutter/widgets/carrousel_images.dart';
import 'package:portafolio_flutter/widgets/carrousel_tec.dart';
import 'package:portafolio_flutter/widgets/image_dialog.dart';
import 'package:portafolio_flutter/widgets/image_widget.dart';
import 'package:portafolio_flutter/widgets/section_container.dart';
import 'package:portafolio_flutter/widgets/text_animated.dart';

class PageFinniu extends StatelessWidget {
  const PageFinniu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    // final height = MediaQuery.of(context).size.height - 50;
    return SizedBox(
      width: width,
      child: width > 600
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                _FirstSection(),
                _SecondSection(),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                _FirstSection(),
                _SecondSection(),
              ],
            ),
    );
  }
}

class _FirstSection extends StatelessWidget {
  const _FirstSection({
    // ignore: unused_element
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> listWidget = [
      TectItemAbout(name: 'Dart', svg: 'assets/svg/dart.svg'),
      TectItemAbout(name: 'Flutter', svg: 'assets/svg/flutter.svg'),
      TectItemAbout(name: 'GraphQL', svg: 'assets/svg/graphql.svg'),
      TectItemAbout(name: 'GitHub', svg: 'assets/svg/github-light.svg'),
    ];
    const String text =
        '''En este proyecto se me asignó la responsabilidad de maquetar e integrar las nuevas pantallas en coordinación con el equipo de diseño.''';
    return SectionWidget(
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TitleAnimated(text: "Finniu App", textAlign: TextAlign.start),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TectItem(
                key: Key('apple'),
                name: 'Ios',
                svg: 'assets/svg/apple_light.svg',
              ),
              const SizedBox(width: 5),
              TectItem(
                key: Key('movil'),
                name: 'Android',
                svg: 'assets/svg/android-icon.svg',
              ),
            ],
          ),
          TextAnimated(text: text, textAlign: TextAlign.start),
          SubTitleAnimated(
            text: "Tecnologias",
            textAlign: TextAlign.start,
          ),
          Center(
            child: CarrouselTecAbout(
              listWidget: listWidget,
            ),
          )
        ],
      ),
    );
  }
}

class _SecondSection extends StatelessWidget {
  const _SecondSection({
    // ignore: unused_element
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const List<String> imagesList = [
      'assets/finniu/finniu_init.png',
      'assets/finniu/finniu_cronograma.png',
      'assets/finniu/finniu_my_invest.png',
      'assets/finniu/finniu_pre_invest.png',
      'assets/finniu/finniu_reinvest.png',
    ];
    final List<Widget> listImages = imagesList
        .map((url) => HoverableImage(
            url: url, onTap: () => showImage(context: context, url: url)))
        .toList();
    return SectionWidget(
      child: CarrouselImages(
        images: listImages,
      ),
    );
  }
}
