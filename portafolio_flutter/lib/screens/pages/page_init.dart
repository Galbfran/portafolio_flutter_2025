import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portafolio_flutter/widgets/carrousel_tec.dart';

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
                DefaultTextStyle(
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: width < 600 ? 30 : 50,
                    fontWeight: FontWeight.w700,
                  ),
                  child: AnimatedTextKit(
                    totalRepeatCount: 1,
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Franco Galbiati',
                      ),
                    ],
                  ),
                ),
                DefaultTextStyle(
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: width < 600 ? 20 : 30,
                    fontWeight: FontWeight.w600,
                  ),
                  child: AnimatedTextKit(
                    totalRepeatCount: 1,
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Desarrollador Full Stack',
                      ),
                    ],
                  ),
                ),
                DefaultTextStyle(
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: width < 600 ? 15 : 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54),
                  child: AnimatedTextKit(
                    totalRepeatCount: 1,
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Creando soluciones digitales elegantes y funcionales con pasión por el detalle y la experiencia del usuario.',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                CarrouselTec()
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
