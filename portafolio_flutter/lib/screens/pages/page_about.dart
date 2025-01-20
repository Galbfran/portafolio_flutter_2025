import 'package:flutter/material.dart';
import 'package:portafolio_flutter/const/theme.dart';
import 'package:portafolio_flutter/widgets/carrousel_tec.dart';
import 'package:portafolio_flutter/widgets/page_exp.dart';
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
                FirstSection(),
                SecondSection(),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                FirstSection(),
                SecondSection(),
              ],
            ),
    );
  }
}

class FirstSection extends StatelessWidget {
  const FirstSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const String text =
        '''Como desarrollador Full Stack, combino creatividad y experiencia técnica para construir aplicaciones web modernas y escalables. Mi enfoque se centra en crear soluciones que no solo funcionen perfectamente, sino que también ofrezcan una experiencia de usuario excepcional.\nDestaco mi capacidad para utilizar Flutter en el desarrollo móvil, así como la implementación de bibliotecas como Auth0 para la gestiónde autenticación y las APIs de Google Maps, entre otras.''';

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

class SecondSection extends StatelessWidget {
  const SecondSection({
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

class SectionWidget extends StatelessWidget {
  const SectionWidget({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Container(
      constraints: const BoxConstraints(minHeight: 450),
      width: width > 600 ? width * 0.45 : width,
      height: width > 600 ? 600 : 0,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: primaryColor,
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            offset: Offset(0, 5),
          )
        ],
        border: Border.all(color: secundaryColor),
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }
}
