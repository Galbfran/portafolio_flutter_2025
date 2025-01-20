import 'package:flutter/material.dart';
import 'package:portafolio_flutter/const/theme.dart';
import 'package:portafolio_flutter/widgets/carrousel_tec.dart';
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
    const String text = '''Soy Franco Galbiati, de Argentina Buenos Aires.''';
    const String textExperience =
        """Apasionado desarrollador con experiencia en la creación de aplicaciones móviles y web utilizando tecnologías modernas como Flutter, Node.js, Express, Sequelize y PostgreSQL. Destaco mi capacidad para utilizar Flutter en el desarrollo móvil, así como la implementación de bibliotecas como Auth0 para la gestiónde autenticación y las APIs de Google Maps, entre otras.""";
    return SectionWidget(
      child: Column(
        spacing: 5,
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
          TextAnimated(
            text: textExperience,
            textAlign: TextAlign.start,
          ),
          SubTitleAnimated(
            text: "Tecnologias",
            textAlign: TextAlign.start,
          ),
          Center(child: CarrouselTecAbout())
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
      child: Text("about"),
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
      width: width > 600 ? width * 0.45 : width,
      height: 450,
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
