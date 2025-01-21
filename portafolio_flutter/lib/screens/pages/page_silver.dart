import 'package:flutter/material.dart';
import 'package:portafolio_flutter/widgets/carrousel_images.dart';
import 'package:portafolio_flutter/widgets/carrousel_tec.dart';
import 'package:portafolio_flutter/widgets/image_dialog.dart';
import 'package:portafolio_flutter/widgets/image_widget.dart';
import 'package:portafolio_flutter/widgets/section_container.dart';
import 'package:portafolio_flutter/widgets/text_animated.dart';

class PageSilver extends StatelessWidget {
  const PageSilver({
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
                _SecondSection(),
                _FirstSection(),
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
    const List<String> imagesList = [
      'assets/silver/silver_init.jpeg',
      'assets/silver/silver_home.jpeg',
      'assets/silver/silver_form.jpeg',
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

class _SecondSection extends StatelessWidget {
  const _SecondSection({
    // ignore: unused_element
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const String text =
        '''En este proyecto se realizó un sistema para la administración de una empresa de Taxis, en la cual se implementó Flutter para crear el front-end y Express.js con Sequelize y PostgreSQL para back-end.''';
    return SectionWidget(
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TitleAnimated(text: "Silver App", textAlign: TextAlign.end),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TectItem(
                key: Key('web'),
                name: 'Web',
                svg: 'assets/svg/html5.svg',
              ),
              const SizedBox(width: 5),
              TectItem(
                key: Key('movil'),
                name: 'Android',
                svg: 'assets/svg/android-icon.svg',
              ),
            ],
          ),
          TextAnimated(text: text, textAlign: TextAlign.end),
        ],
      ),
    );
  }
}
