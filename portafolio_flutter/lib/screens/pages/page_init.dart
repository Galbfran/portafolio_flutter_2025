import 'package:flutter/material.dart';

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
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Stack(
          children: const [],
        ),
      ),
    );
  }
}
