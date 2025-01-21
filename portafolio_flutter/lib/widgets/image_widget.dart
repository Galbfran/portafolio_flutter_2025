import 'package:flutter/material.dart';

class HoverableImage extends StatelessWidget {
  const HoverableImage({
    super.key,
    required this.url,
    this.onTap,
    this.width = 200,
    this.height = 200,
    this.borderRadius = 10.0,
    this.hoverColor = Colors.amber,
  });

  final String url;
  final VoidCallback? onTap;
  final double width;
  final double height;
  final double borderRadius;
  final Color hoverColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(borderRadius),
        mouseCursor: SystemMouseCursors.click,
        hoverColor: hoverColor.withOpacity(0.3),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ImageWidget(
              url: url,
              width: width,
              height: height,
            ),
          ),
        ),
      ),
    );
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.url,
    this.width = 200,
    this.height = 200,
  });

  final String url;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      url,
      width: width,
      height: height,
      filterQuality: FilterQuality.low,
    );
  }
}
