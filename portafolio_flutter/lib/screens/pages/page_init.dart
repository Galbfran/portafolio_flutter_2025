import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portafolio_flutter/widgets/carrousel_tec.dart';
import 'package:portafolio_flutter/widgets/text_animated.dart';

class PageInit extends StatelessWidget {
  const PageInit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.of(context).size.height - 50;
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: width / 1.5,
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TitleAnimated(
                  text: "Franco Galbiati",
                ),
                SubTitleAnimated(
                  text: "Desarrollador Full Stack",
                ),
                TextAnimated(
                  text:
                      "Creando soluciones digitales elegantes y funcionales con pasión por el detalle y la experiencia del usuario.",
                ),
                CarrouselTecInit()
              ],
            ),
          ),
          Positioned(
            top: -15,
            left: -15,
            child: FadeInLeft(
              duration: const Duration(seconds: 1),
              child: SvgPicture.asset('assets/svg/logo_fran_svg.svg',
                  width: 150, height: 150),
            ),
          ),
          Positioned(
            bottom: -15,
            right: -15,
            child: FadeInRight(
              duration: const Duration(seconds: 1),
              child: SvgPicture.asset('assets/svg/logo_fran_svg.svg',
                  width: 150, height: 150),
            ),
          ),
        ],
      ),
    );
  }
}
