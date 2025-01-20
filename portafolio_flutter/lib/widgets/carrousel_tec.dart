import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portafolio_flutter/const/theme.dart';

class CarrouselTec extends StatelessWidget {
  const CarrouselTec({
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

class CarouselTecnologi extends StatelessWidget {
  const CarouselTecnologi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: CarouselSlider(
          items: [
            ItemCarrousel(
              name: 'react',
              icon: Icon(Icons.android),
            ),
            ItemCarrousel(
              name: 'react',
              icon: Icon(Icons.android),
            ),
            ItemCarrousel(
              name: 'react',
              icon: Icon(Icons.android),
            )
          ],
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: false,
            viewportFraction: 0.2,
            clipBehavior: Clip.none,
          ),
        ),
      ),
    );
  }
}

class ItemCarrousel extends StatelessWidget {
  const ItemCarrousel({
    super.key,
    required this.name,
    required this.icon,
  });
  final String name;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      width: 100,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.circle,
            size: 50,
          ),
          Text(name)
        ],
      ),
    );
  }
}
