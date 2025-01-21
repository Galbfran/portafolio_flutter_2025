import 'package:flutter/material.dart';
import 'package:portafolio_flutter/widgets/carrousel_tec.dart';
import 'package:portafolio_flutter/widgets/page_exp.dart';
import 'package:portafolio_flutter/widgets/section_container.dart';
import 'package:portafolio_flutter/widgets/text_animated.dart';

class PageAbout extends StatelessWidget {
  const PageAbout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

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
    const String text =
        '''Como desarrollador Full Stack, combino creatividad y experiencia técnica para construir aplicaciones web modernas y escalables. Mi enfoque se centra en crear soluciones que no solo funcionen perfectamente, sino que también ofrezcan una experiencia de usuario excepcional.\nDestaco mi capacidad para utilizar Flutter en el desarrollo móvil, así como la implementación de bibliotecas como Auth0 para la gestión de autenticación y las APIs de Google Maps, entre otras.''';

    return SectionWidget(
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SubTitleAnimated(
            text: "Acerca de mi:",
            textAlign: TextAlign.start,
          ),
          TextAnimated(
            text: text,
            textAlign: TextAlign.start,
          ),
          SubTitleAnimated(
            text: "Tecnologias",
            textAlign: TextAlign.start,
          ),
          Center(
            child: CarrouselTecAbout(),
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
    return SectionWidget(
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SubTitleAnimated(
            text: "Experiencias Laborales",
            textAlign: TextAlign.start,
          ),
          PageExp(),
        ],
      ),
    );
  }
}
