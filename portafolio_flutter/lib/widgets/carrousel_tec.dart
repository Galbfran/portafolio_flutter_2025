import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portafolio_flutter/const/theme.dart';

class CarrouselTecInit extends StatelessWidget {
  const CarrouselTecInit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> listWidget = [
      TectItem(
        key: Key('dart'),
        name: 'Dart',
        svg: 'assets/svg/dart.svg',
      ),
      TectItem(
        key: Key('flutter'),
        name: 'Flutter',
        svg: 'assets/svg/flutter.svg',
      ),
      TectItem(
        key: Key('typescript'),
        name: 'TypeScript',
        svg: 'assets/svg/typescript.svg',
      ),
      TectItem(
        key: Key('react'),
        name: 'React',
        svg: 'assets/svg/react.svg',
      ),
      TectItem(
        key: Key('nodejs'),
        name: 'Node.js',
        svg: 'assets/svg/nodejs.svg',
      ),
      TectItem(
        key: Key('github'),
        name: 'Git Hub',
        svg: 'assets/svg/github-light.svg',
      ),
      TectItem(
        key: Key('auth0'),
        name: 'Auth0',
        svg: 'assets/svg/auth0.svg',
      ),
      TectItem(
        key: Key('jwt'),
        name: 'JWT',
        svg: 'assets/svg/jwt.svg',
      ),
    ];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 700,
        height: 40,
        child: CarouselSlider(
          items: listWidget,
          options: CarouselOptions(
            clipBehavior: Clip.none,
            autoPlay: true,
            enlargeCenterPage: false,
            viewportFraction: 0.25,
          ),
        ),
      ),
    );
  }
}

class TectItem extends StatelessWidget {
  const TectItem({
    super.key,
    required this.name,
    required this.svg,
  });
  final String name;
  final String svg;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Container(
      padding: EdgeInsets.all(5),
      width: 150,
      height: 30,
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
      child: Row(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(svg, width: 20, height: 20),
          if (width > 600)
            Text(
              name,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )
        ],
      ),
    );
  }
}

class CarrouselTecAbout extends StatefulWidget {
  const CarrouselTecAbout({super.key});

  @override
  State<CarrouselTecAbout> createState() => _CarrouselTecAboutState();
}

class _CarrouselTecAboutState extends State<CarrouselTecAbout> {
  late PageController _controller;
  late Timer _timer;
  final int _interval = 2; // Tiempo en segundos
  final List<Widget> listWidget = [
    TectItemAbout(name: 'Dart', svg: 'assets/svg/dart.svg'),
    TectItemAbout(name: 'Flutter', svg: 'assets/svg/flutter.svg'),
    TectItemAbout(name: 'TypeScript', svg: 'assets/svg/typescript.svg'),
    TectItemAbout(name: 'React', svg: 'assets/svg/react.svg'),
    TectItemAbout(name: 'Node.js', svg: 'assets/svg/nodejs.svg'),
    TectItemAbout(name: 'GitHub', svg: 'assets/svg/github-light.svg'),
    TectItemAbout(name: 'Auth0', svg: 'assets/svg/auth0.svg'),
    TectItemAbout(name: 'JWT', svg: 'assets/svg/jwt.svg'),
  ];

  @override
  void initState() {
    super.initState();
    _controller = PageController(viewportFraction: 0.25, initialPage: 500);

    _timer = Timer.periodic(Duration(seconds: _interval), (timer) {
      if (_controller.hasClients) {
        _controller.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: 100,
        child: PageView.builder(
          controller: _controller,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            final realIndex = index % listWidget.length;
            return listWidget[realIndex];
          },
        ),
      ),
    );
  }
}

class TectItemAbout extends StatelessWidget {
  const TectItemAbout({
    super.key,
    required this.name,
    required this.svg,
  });

  final String name;
  final String svg;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(5),
      width: 100,
      height: 150,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(svg, width: 40, height: 40),
          const SizedBox(height: 5),
          Text(
            name,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
