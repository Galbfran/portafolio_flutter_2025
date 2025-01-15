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

class SectionSubtitle extends StatelessWidget {
  const SectionSubtitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.green,
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.amber,
      ),
    );
  }
}
