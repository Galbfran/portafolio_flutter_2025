import 'package:flutter/material.dart';
import 'package:portafolio_flutter/screens/pages/page_init.dart';

class PageAbout extends StatelessWidget {
  const PageAbout({
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
        child: width > 600
            ? Row(
                spacing: 10,
                children: [
                  SectionTitle(),
                  SectionSubtitle(),
                ],
              )
            : Column(
                spacing: 10,
                children: [
                  SectionTitle(),
                  SectionSubtitle(),
                ],
              ),
      ),
    );
  }
}
