import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class TextAnimated extends StatelessWidget {
  const TextAnimated({
    super.key,
    required this.text,
    this.textAlign = TextAlign.center,
  });
  final String text;
  final TextAlign textAlign;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return DefaultTextStyle(
      textAlign: TextAlign.center,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontSize: width < 600 ? 15 : 20,
          fontWeight: FontWeight.w500,
          color: Colors.black54),
      child: AnimatedTextKit(
        totalRepeatCount: 1,
        animatedTexts: [
          TypewriterAnimatedText(
            text,
            textAlign: textAlign,
          ),
        ],
      ),
    );
  }
}

class SubTitleAnimated extends StatelessWidget {
  const SubTitleAnimated({
    super.key,
    required this.text,
    this.textAlign = TextAlign.center,
  });
  final String text;
  final TextAlign textAlign;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return DefaultTextStyle(
      textAlign: TextAlign.center,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: width < 600 ? 20 : 30,
        fontWeight: FontWeight.w600,
      ),
      child: AnimatedTextKit(
        totalRepeatCount: 1,
        animatedTexts: [
          TypewriterAnimatedText(
            text,
            textStyle: TextStyle(color: Colors.black),
            textAlign: textAlign,
          ),
        ],
      ),
    );
  }
}

class TitleAnimated extends StatelessWidget {
  const TitleAnimated({
    super.key,
    required this.text,
    this.textAlign = TextAlign.center,
  });
  final String text;
  final TextAlign textAlign;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return DefaultTextStyle(
      textAlign: TextAlign.center,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: width < 600 ? 30 : 50,
        fontWeight: FontWeight.w700,
      ),
      child: AnimatedTextKit(
        totalRepeatCount: 1,
        animatedTexts: [
          TypewriterAnimatedText(
            text,
            textStyle: TextStyle(
              color: Colors.black,
            ),
            textAlign: textAlign,
          ),
        ],
      ),
    );
  }
}
