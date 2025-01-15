import 'package:flutter/material.dart';

class PageFinniu extends StatelessWidget {
  const PageFinniu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.of(context).size.height - 50;
    return SizedBox(
      width: width,
      height: height,
    );
  }
}
