import 'package:flutter/material.dart';
import 'package:portafolio_flutter/widgets/carrousel_images.dart';
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
    const String text = '';
    return SectionWidget(
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TitleAnimated(text: "Finniu App", textAlign: TextAlign.start),
          SubTitleAnimated(
              text: "Desarrollo Android y Ios", textAlign: TextAlign.start),
          TextAnimated(text: text, textAlign: TextAlign.start),
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
    final List<Widget> listImages = [
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/logo_fran_png.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/logo_fran_png.png'),
            fit: BoxFit.cover,
          ),
        ),
      )
    ];
    return SectionWidget(
      child: CarrouselImages(
        images: listImages,
      ),
    );
  }
}
