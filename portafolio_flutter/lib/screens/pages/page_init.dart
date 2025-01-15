import 'package:flutter/material.dart';

class PageInit extends StatelessWidget {
  const PageInit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.of(context).size.height - 50;
    return Container(
      width: width,
      height: height,
      color: Colors.red,
    );
  }
}
