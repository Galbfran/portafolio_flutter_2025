import 'package:flutter/material.dart';

class TextHover extends StatefulWidget {
  const TextHover({super.key});

  @override
  State<TextHover> createState() => _TextHoverState();
}

class _TextHoverState extends State<TextHover> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedDefaultTextStyle(
        duration: const Duration(milliseconds: 200),
        style: TextStyle(
          color: isHovered ? Colors.grey : Colors.amber,
          fontSize: isHovered ? 20 : 18,
          fontWeight: isHovered ? FontWeight.bold : FontWeight.normal,
        ),
        child: const Text('Portafolio Galbiati Franco'),
      ),
    );
  }
}
