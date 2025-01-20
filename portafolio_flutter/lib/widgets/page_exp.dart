import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portafolio_flutter/const/theme.dart';
import 'package:portafolio_flutter/widgets/carrousel_tec.dart';
import 'package:portafolio_flutter/widgets/text_animated.dart';

final List<Widget> listExp = [
  Column(
    spacing: 5,
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SvgPicture.asset(
        "assets/svg/silver_app.svg",
        width: 150,
        height: 150,
      ),
      SubTitleAnimated(text: "Silver App"),
      TextAnimated(text: "Flutter, Express, JWT, Sequelize y PosgresSQL"),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
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
      )
    ],
  ),
  Column(
    spacing: 5,
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SvgPicture.asset(
        "assets/svg/finniu_app.svg",
        width: 150,
        height: 150,
      ),
      SubTitleAnimated(text: "Finniu App"),
      TextAnimated(text: "Flutter y GraphQL"),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
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
      )
    ],
  ),
];

class PageExp extends StatefulWidget {
  const PageExp({super.key});

  @override
  State<PageExp> createState() => _PageExpState();
}

class _PageExpState extends State<PageExp> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  late Timer _timer;
  bool autoScrool = true;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (autoScrool) {
        if (_currentPage < listExp.length - 1) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
      width: 400,
      height: 385,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        // crossAxisAlignment: CrossAxisAlignment.,
        children: [
          SizedBox(
            height: 290,
            width: 350,
            child: PageView.builder(
              controller: _pageController,
              itemCount: listExp.length,
              itemBuilder: (context, index) {
                return listExp[index];
              },
            ),
          ),
          SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                autoScrool
                    ? SizedBox()
                    : ElevatedButton.icon(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(
                              Colors.green.withValues(
                            alpha: 0.5,
                          )),
                        ),
                        onPressed: () {
                          _pageController.animateToPage(
                            0,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        },
                        icon: const Icon(Icons.arrow_back_ios),
                        label: const Text("Silver"),
                      ),
                Switch(
                    activeColor: Colors.green,
                    activeTrackColor: Colors.green.withValues(
                      alpha: 0.5,
                    ),
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor: Colors.yellow.shade200,
                    value: autoScrool,
                    onChanged: (_) {
                      setState(() {
                        autoScrool = !autoScrool;
                        if (autoScrool) {
                          _startAutoScroll();
                        } else {
                          _timer.cancel();
                        }
                      });
                    }),
                autoScrool
                    ? SizedBox()
                    : ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(
                              Colors.green.withValues(alpha: 0.5)),
                        ),
                        onPressed: () {
                          _pageController.animateToPage(
                            1,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text("Finniu"),
                            SizedBox(width: 8),
                            Icon(Icons.arrow_forward_ios),
                          ],
                        ),
                      ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
