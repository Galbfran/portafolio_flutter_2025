import 'package:flutter/material.dart';
import 'package:portafolio_flutter/const/theme.dart';

class SectionWidget extends StatelessWidget {
  const SectionWidget({
    super.key,
    required this.child,
    this.background = true,
  });
  final Widget child;
  final bool background;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Container(
      constraints: const BoxConstraints(minHeight: 450),
      width: width > 600 ? width * 0.45 : width,
      height: width > 600 ? 600 : 0,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(15),
      decoration: background
          ? BoxDecoration(
              color: const Color.fromARGB(255, 226, 230, 171),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 5,
                  offset: Offset(0, 5),
                )
              ],
              border: Border.all(color: secundaryColor),
              borderRadius: BorderRadius.circular(20),
            )
          : null,
      child: child,
    );
  }
}
